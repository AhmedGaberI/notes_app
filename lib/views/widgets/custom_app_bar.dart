import 'package:flutter/material.dart';

import 'package:notes_app/views/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key, required this.title, required this.iconData, this.onPressed})
      : super(key: key);

  final String title;
  final IconData iconData;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 29),
          ),
          const Spacer(),
          CustomIcon(
            icon: iconData,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
