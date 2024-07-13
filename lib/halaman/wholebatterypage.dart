import 'package:flutter/material.dart';

class MyWholeBatteryPage extends StatelessWidget {
  final String realTimeValue;

  const MyWholeBatteryPage({super.key, required this.realTimeValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 70),
      child: Column(
        children: [
          Image.asset('assets/img/normal.png', scale: 1.5),
          const SizedBox(height: 20), // Spacer between image and text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Status",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text("Kesehatan : $realTimeValue",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ],
          ),
          const SizedBox(height: 10), // Spacer between rows
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Voltase",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              Text("Arus",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ],
          ),
        ],
      ),
    );
  }
}
