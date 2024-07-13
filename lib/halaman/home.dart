import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smilesbeta00/halaman/batterycellpage.dart';
import 'package:smilesbeta00/halaman/helppage.dart';
import 'package:smilesbeta00/halaman/menupage.dart';
import 'package:smilesbeta00/halaman/wholebatterypage.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<MyHome> {
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  int selectedIndex = 0;
  List<IconData> data = [
    Icons.battery_full_rounded,
    Icons.rectangle_rounded,
  ];

  List<Widget> pages = [
    const MyWholeBatteryPage(),
    const MyBatteryCellPage(), // Placeholder for other page
  ];

  @override
  Widget build(BuildContext context) {
    double navigationBarWidth =
        100 + (data.length * 100); // Adjust this value based on your needs

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Smiles',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        titleSpacing: 0,
        leading: Image.asset('assets/img/smileslogo.png'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpPage()),
              );
            },
            icon: const Icon(Icons.question_mark, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage()),
              );
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
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _fApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Ada masalah dengan firebase"));
          } else if (snapshot.connectionState == ConnectionState.done) {
            return pages[selectedIndex];
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 90, right: 90),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(60),
          child: Container(
            height: 70,
            width: navigationBarWidth,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/img/appbarbg.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: data.map((iconData) {
                int i = data.indexOf(iconData);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = i;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: 60,
                      decoration: BoxDecoration(
                        border: i == selectedIndex
                            ? const Border(
                                bottom:
                                    BorderSide(width: 3.0, color: Colors.blue))
                            : null,
                        gradient: i == selectedIndex
                            ? const LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.transparent
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )
                            : null,
                      ),
                      child: Center(
                        child: Icon(
                          iconData,
                          size: 30,
                          color: i == selectedIndex
                              ? Colors.white
                              : Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
