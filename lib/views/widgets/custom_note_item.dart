import 'package:flutter/material.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
      decoration: BoxDecoration(
        color: const Color(0xffFFCC80),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Text(
              "Flutter tips",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text(
                "Build you Career with Ahmed Gaber",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(.5),
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 24,
            ),
            child: Text(
              "May21 , 2022",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(.5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
