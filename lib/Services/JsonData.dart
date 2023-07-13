import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AddressWriteRead{
  final databaseref= FirebaseDatabase.instance.ref("UserAddress");
  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference();


  void CreateDataBase(String path, Map<String, dynamic> data,String email){
    final uniqueKey=databaseReference.child("UserAddress").child(FirebaseAuth.instance.currentUser!.uid).push().key;
    databaseref.child(email).child(uniqueKey!).set(data);

  }
}
