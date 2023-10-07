import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: const [
            CustomAppBar(
              title: "Edit Note",
              iconData: Icons.done,
            ),
            SizedBox(
              height: 32,
            ),
            CustomTextField(hintText: "Title"),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              hintText: "Content",
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
