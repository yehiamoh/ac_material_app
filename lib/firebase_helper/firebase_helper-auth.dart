

import 'package:ac_material_app/models/user_mode.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseHelper {

  /*Future<void> signUp(String name, String email, String password) async {
     await FirebaseAuth.instance.createUserWithEmailAndPassword(email:email, password: password);
    UserModel userModel = UserModel(id: FirebaseAuth.instance.currentUser!.uid, name: name);
    await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).set(
        userModel.tojson());

  }*/
  Future<void> login(String email,String password)async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

}
