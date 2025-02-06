import 'package:clean_note_app/features/create_note/presentation/ui/create_note_screen.dart';
import 'package:clean_note_app/features/home/presentation/provider/get_notes_provider.dart';
import 'package:clean_note_app/features/home/presentation/ui/widget/home_app_bar.dart';
import 'package:clean_note_app/features/home/presentation/ui/widget/note_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() => ref.read(getNotesProvider.notifier).getNotes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HomeAppBar(),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final notesProvider = ref.watch(getNotesProvider);

            if (notesProvider.isSuccess) {
              if (notesProvider.notes.isEmpty) {
                return const Center(
                  child: Text(
                    "لاتوجد ملاحظات حتى الان",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'ElMessiri',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                );
              }
              return ListView(
                children: [
                  ...notesProvider.notes.map((note) => NoteCard(
                        key: UniqueKey(),
                        note: note,
                      )),
                  const SizedBox(height: 50),
                ],
              );
            } else if (notesProvider.errorMessage != null) {
              return Text(
                notesProvider.errorMessage!,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              );
            } else {
              return const Center(
                child: SpinKitThreeBounce(
                  color: Colors.white,
                  size: 25,
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            useSafeArea: true,
            context: context,
            builder: (context) => const Dialog(
              backgroundColor: Colors.transparent,
              alignment: Alignment.center,
              insetPadding: EdgeInsets.zero,
              child: CreateNoteScreen(),
            ),
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.orange,
        ),
      ),
    );
  }
}
