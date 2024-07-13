import 'package:flutter/material.dart';

class MyBatteryCellPage extends StatelessWidget {
  const MyBatteryCellPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data tegangan baterai untuk setiap kotak
    List<double> voltages = [
      4.0, 3.5, 3.8, 4.1, 3.7, 3.3, 2.9, 3.2, 3.1, 2.7, 2.5, 3.4, 3.6, 3.9, 4.2,
      2.4, 2.8, 2.6, 1.5, 1.0, 0.8, 0.5, 3.0, 3.1, 3.2, 3.4, 3.6, 3.8, 4.0, 4.1,
      4.2, 3.9, 3.8, 3.7, 3.5
    ];

    // Fungsi untuk menentukan warna berdasarkan tegangan
    Color getColor(double voltage) {
      if (voltage >= 3.3 && voltage <= 4.2) {
        return const Color.fromARGB(255, 165, 252, 168); // Hijau (Normal)
      } else if (voltage >= 2.5 && voltage < 3.3) {
        return Colors.orange; // Kuning (Hati-hati)
      } else {
        return Colors.red; // Merah (Mati)
      }
    }

    return Center(
      child: GridView.count(
        padding: const EdgeInsets.only(top: 70),
        mainAxisSpacing: 58,
        crossAxisCount: 7,
        childAspectRatio: 1,
        children: [
          for (int i = 0; i < voltages.length; i++) // Looping sesuai panjang list voltages
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      String status;
                      if (voltages[i] >= 3.3 && voltages[i] <= 4.2) {
                        status = 'Normal';
                      } else if (voltages[i] >= 2.5 && voltages[i] < 3.3) {
                        status = 'Hati-hati';
                      } else {
                        status = 'Mati';
                      }
                      return AlertDialog(
                          title: Text(status),
                          content: Text(
                            'Tegangan: ${voltages[i]} V\nArus: 2 A\n',
                            textAlign: TextAlign.center,
                          ));
                    });
              },
              child: Container(
                height: 41,
                width: 41,
                margin: const EdgeInsets.all(7), // Jarak antar kotak
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 0.5,
                    colors: [
                      getColor(voltages[i]).withOpacity(0.5), // Transparent center color
                      getColor(voltages[i]), // Solid edge color
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26, // Shadow color
                      offset: Offset(2, 2), // Shadow position
                      blurRadius: 4, // Shadow blur effect
                    ),
                    BoxShadow(
                      color: Colors.white, // Highlight color
                      offset: Offset(-2, -2), // Highlight position
                      blurRadius: 4, // Highlight blur effect
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '${i + 1}', // Display the number
                    style: const TextStyle(
                      color: Colors.black, // Text color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Baterai sel')),
      body: MyBatteryCellPage(),
    ),
  ));
}