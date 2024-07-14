import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref().child('presentase');

  Stream<String> getRealTimeValue() {
    return _databaseReference.onValue.map((event) {
      return event.snapshot.value.toString();
    });
  }
}
