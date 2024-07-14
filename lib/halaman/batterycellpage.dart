import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Battery Cells',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyBatteryCellPage(),
    );
  }
}

class MyBatteryCellPage extends StatefulWidget {
  const MyBatteryCellPage({Key? key}) : super(key: key);

  @override
  _MyBatteryCellPageState createState() => _MyBatteryCellPageState();
}

class _MyBatteryCellPageState extends State<MyBatteryCellPage> {
  late DatabaseReference _databaseReference;
  List<double> voltages = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
  }

  Future<void> _initializeFirebase() async {
    _databaseReference = FirebaseDatabase.instance.ref().child('voltages');

    _databaseReference.onValue.listen((event) {
      voltages.clear();
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> values = event.snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          voltages.add(double.parse(value['voltage'].toString()));
        });
        setState(() {
          isLoading = false;  // Set isLoading to false once data is loaded
        });
      }
    });
  }

 
  Color getColor(double voltage) {
    if (voltage >= 3.3 && voltage <= 4.2) {
      return const Color.fromARGB(255, 165, 252, 168); 
    } else if (voltage >= 2.5 && voltage < 3.3) {
      return Colors.orange; 
    } else {
      return Colors.red; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Cells'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())  // Show loading indicator
          : Center(
              child: GridView.count(
                padding: const EdgeInsets.only(top: 70),
                mainAxisSpacing: 58,
                crossAxisCount: 7,
                childAspectRatio: 1,
                children: List.generate(
                  voltages.length,
                  (index) => InkWell(
                    onTap: () {
                      String status;
                      if (voltages[index] >= 3.3 && voltages[index] <= 4.2) {
                        status = 'Normal';
                      } else if (voltages[index] >= 2.5 && voltages[index] < 3.3) {
                        status = 'Hati-hati';
                      } else {
                        status = 'Mati';
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text(status),
                          content: Text(
                            'Tegangan: ${voltages[index]} V\nArus: 2 A\n',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 41,
                      width: 41,
                      margin: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          center: Alignment.center,
                          radius: 0.5,
                          colors: [
                            getColor(voltages[index]).withOpacity(0.5),
                            getColor(voltages[index]),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-2, -2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}