import 'package:firebase_database/firebase_database.dart';

class AddressWriteRead {
  final databaseref = FirebaseDatabase.instance.ref("UserAddress");

  void CreateDataBase(
      String path, Map<String, dynamic> data, String email, int total) {
    databaseref.child(email).child(total.toString()).set(data);
  }
}
