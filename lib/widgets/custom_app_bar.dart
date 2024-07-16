import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      titleSpacing: 0,
      leading: Image.asset('assets/img/smileslogo.png'),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/help');
          },
          icon: const Icon(Icons.question_mark, color: Colors.black),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/menu');
          },
          icon: const Icon(Icons.menu_rounded, color: Colors.black),
        ),
      ],
      toolbarHeight: 70,
      elevation: 20,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/appbarbg.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
