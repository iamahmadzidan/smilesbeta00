import 'package:flutter/material.dart';

class MyBatteryCellPage extends StatelessWidget {
  const MyBatteryCellPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define colors for each cell
    List<Color> colors = [
      Colors.red,
      Colors.orange,
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
      const Color.fromARGB(255, 165, 252, 168),
    ];

    return Center(
      child: GridView.count(
        padding: const EdgeInsets.only(top: 70),
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
                      return  const AlertDialog(
                          title: Text('Normal'),
                          content: Text(
                            'Tegangan \nArus 2 A\n',
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
                      colors[i].withOpacity(0.5), // Transparent center color
                      colors[i], // Solid edge color
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
