import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    Key? key,
    this.isActive = false,
    required this.color,
  }) : super(key: key);
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(radius: 38, backgroundColor: color);
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({
    Key? key,
    required this.status,
    this.note,
  }) : super(key: key);
  final String status;
  final NoteModel? note;
  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    widget.status == "edit"
        ? currentIndex = colors.indexOf(Color(widget.note!.color))
        : currentIndex = 0;
  }

  List<Color> colors = [
    const Color(0xffF46036),
    const Color(0xff2E294E),
    const Color(0xff1B998B),
    const Color(0xffE71D36),
    const Color(0xffC5D86D),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.status == "add"
                    ? BlocProvider.of<AddNoteCubit>(context).color =
                        colors[index]
                    : BlocProvider.of<NotesCubit>(context)
                        .updateColor(note: widget.note!, color: colors[index]);
                setState(() {});
              },
              child: ColorItem(
                color: colors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
