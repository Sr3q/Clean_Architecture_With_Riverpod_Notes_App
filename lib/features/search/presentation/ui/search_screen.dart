import 'dart:async';

import 'package:clean_note_app/common/style/decorations/search_field_decoration.dart';
import 'package:clean_note_app/features/home/presentation/ui/widget/note_card.dart';
import 'package:clean_note_app/features/search/presentation/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _formKey = GlobalKey<FormState>();
  Timer? _debounce;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              textAlign: TextAlign.right,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
              decoration: SearchFieldDecoration.fieldDecoration(
                size,
                context,
                null,
                'ابحث هنا...',
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                IconButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                      ref.read(searchProvider.notifier).clear();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    )),
              ),
              // controller: noteProvider.titleController,
              // validator: validator,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  if (_debounce?.isActive ?? false) _debounce!.cancel();
                  _debounce = Timer(const Duration(milliseconds: 300), () {
                    ref.read(searchProvider.notifier).search(value);
                  });
                }
              },
              canRequestFocus: true,
            ),
          ),
          SizedBox(
            height: size.height * 0.003,
          ),
          Flexible(
            child: Center(
              child: Consumer(
                builder: (context, ref, child) {
                  final noteProvider = ref.watch(searchProvider);
                  final searchNotes = noteProvider.notes;

                  if (noteProvider.isSuccess) {
                    if (searchNotes.isEmpty) {
                      return const Center(
                        child: Text(
                          "لاتوجد نتائج للبحث",
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
                      itemCount: searchNotes.length + 1,
                      itemBuilder: (context, index) {
                        if (index != searchNotes.length) {
                          return NoteCard(
                            note: searchNotes[index],
                          );
                        } else {
                          return const SizedBox(height: 50);
                        }
                      },
                    );
                  } else if (noteProvider.errorMessage != null) {
                    return Center(child: Text(noteProvider.errorMessage!));
                  } else if (noteProvider.isLoading) {
                    return const Center(
                      child: SpinKitThreeBounce(
                        color: Colors.white,
                        size: 25,
                      ),
                    );
                  } else {
                    return const Center(
                        child: Text(
                          "سوف تظهر نتائج البحث هنا...",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'ElMessiri',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
