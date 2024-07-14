import 'package:flutter/material.dart';
import 'package:smilesbeta00/halaman/batterycellpage.dart';
import 'package:smilesbeta00/halaman/wholebatterypage.dart';
import 'package:smilesbeta00/widgets/custom_app_bar.dart';
import 'package:smilesbeta00/services/firebase_service.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<MyHome> {
  int selectedIndex = 0;
  String realTimeValue = '0';
  final FirebaseService _firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    _firebaseService.getRealTimeValue().listen((value) {
      setState(() {
        realTimeValue = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double navigationBarWidth = 100 + (2 * 100);
    List<Widget> pages = [
      MyWholeBatteryPage(realTimeValue: realTimeValue),
      const MyBatteryCellPage(),
    ];

    return Scaffold(
      appBar: const CustomAppBar(title: 'Smiles'),
      backgroundColor: Colors.white,
      body: pages[selectedIndex],
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
              children: [Icons.battery_full_rounded, Icons.rectangle_rounded].map((iconData) {
                int i = [Icons.battery_full_rounded, Icons.rectangle_rounded].indexOf(iconData);
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
                            ? const Border(bottom: BorderSide(width: 3.0, color: Colors.blue))
                            : null,
                      ),
                      child: Center(
                        child: Icon(
                          iconData,
                          size: 30,
                          color: i == selectedIndex ? Colors.white : Colors.grey.shade800,
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
