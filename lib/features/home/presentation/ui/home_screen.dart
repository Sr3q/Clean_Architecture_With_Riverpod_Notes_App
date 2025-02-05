import 'package:clean_note_app/features/home/presentation/provider/get_notes_provider.dart';
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.logout,
            color: Colors.black,
          ),
          onPressed: () async {},
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: size.height * 0.08,
              width: size.width * 0.2,
            ),
            // SizedBox(width: size.width * 0.02),
            Text(
              'نوتسي',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 40),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                // navigator(const SearchScreen(), context);
                // notesProvider.getToken();
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
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
              return ListView.builder(
                itemCount: notesProvider.notes.length + 1,
                itemBuilder: (context, index) {
                  if (index != notesProvider.notes.length) {
                    return NoteCard(
                      note: notesProvider.notes[index],
                    );
                  } else {
                    return const SizedBox(height: 50);
                  }
                },
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
          // showDialog(
          //   useSafeArea: true,
          //   context: context,
          //   builder: (context) => const Dialog(
          //     backgroundColor: Colors.transparent,
          //     alignment: Alignment.center,
          //     insetPadding: EdgeInsets.zero,
          //     child: CreateNoteCard(),
          //   ),
          // );
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
