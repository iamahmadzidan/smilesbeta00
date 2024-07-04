// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class MyBatteryCellPage extends StatelessWidget {
  const MyBatteryCellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        mainAxisSpacing: 58,
        crossAxisCount: 7,
        childAspectRatio: 1,
        children: [
          for (int i = 0; i < 35; i++) // Looping 35 kali
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: Text('Normal'),
                          content: Text(
                            'Tegangan 4 V\nArus 2 A\n',
                            textAlign: TextAlign.center,
                          ));
                    });
              },
              child: Container(
                height: 41,
                width: 41,
                color: Colors.blue, // Warna kotak
                margin: EdgeInsets.all(7), // Jarak antar kotak
              ),
            ),
        ],
      ),
    );
  }
}
