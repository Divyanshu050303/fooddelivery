import 'package:firebase_database/firebase_database.dart';

class AddressWriteRead{
  final databaseref= FirebaseDatabase.instance.ref("UserAddress");
  int total=0;
  void CreateDataBase(String path, Map<String, dynamic> data,String email){
    databaseref.child(email).child(total.toString()).set(data);
    total++;
  }

}
