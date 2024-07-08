import 'package:flutter/material.dart';

class MyWholeBatteryPage extends StatelessWidget {
  const MyWholeBatteryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 70),
      child: Column(
        children: [
          Image.asset('assets/img/normal.png', scale: 1.5),
          const SizedBox(height: 20), // Spacer between image and text
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Status",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                "Kesehatan",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center
              ),
            ],
          ),
          const SizedBox(height: 10), // Spacer between rows
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Voltase",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center
              ),
              Text(
                "Arus",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center
              ),
            ],
          ),
        ],
      ),
    );
  }
}
