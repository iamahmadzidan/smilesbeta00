import 'package:flutter/material.dart';
import 'package:smilesbeta00/halaman/batterycellpage.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          appBar: AppBar(
              title: const Text('Smiles'),
              titleSpacing: 0,
              leading: Image.asset('assets/img/smileslogo.png'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.question_mark, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings, color: Colors.black),
                ),
              ],
              toolbarHeight: 70,
              elevation: 20,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/appbarbg.png'),
                        fit: BoxFit.cover)),
              ),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.electric_bolt_rounded),
                    text: 'Baterai',
                  ),
                  Tab(
                    icon: Icon(Icons.rectangle_rounded),
                    text: 'Sel',
                  )
                ],
              )),
          body: const TabBarView(
            children: [
              //halaman 1
              Center(
                child: Text('Halaman 1: Kesehatan Keseluruhan Baterai'),
              ),
              //halaman 2
              MyBatteryCellPage(),
            ],
          ),
        ));
  }
}
