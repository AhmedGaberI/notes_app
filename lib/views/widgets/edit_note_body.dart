import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({
    Key? key,
    required this.note,
  }) : super(key: key);
  final NoteModel note;

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            CustomAppBar(
              title: "Edit Note",
              iconData: Icons.done,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subtitle = subtitle ?? widget.note.subtitle;

                widget.note.save();

                BlocProvider.of<NotesCubit>(context).fetchAllNotes();

                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 32,
            ),
            CustomTextField(
              hintText: widget.note.title,
              onChanged: (val) {
                title = val;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              onChanged: (val) {
                subtitle = val;
              },
              hintText: widget.note.subtitle,
              maxLines: 5,
            ),
            const SizedBox(
              height: 32,
            ),
            ColorsListView(
              status: "edit",
              note: widget.note,
            ),
          ],
        ),
      ),
    );
  }
}
