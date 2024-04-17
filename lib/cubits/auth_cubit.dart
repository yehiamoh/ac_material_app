import 'dart:ffi';

import 'package:ac_material_app/firebase_helper/firebase_helper-auth.dart';
import 'package:ac_material_app/models/user_mode.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  FireBaseHelper firebase =FireBaseHelper();
  AuthCubit() : super(AuthInitial());

  Future<User?> Auth (String name, String email, String password)async{
    try{
      emit(AuthLoading());
       UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email:email, password: password);
        UserModel userModel = UserModel(id: FirebaseAuth.instance.currentUser!.uid, name: name);
        await FirebaseFirestore.instance.collection('user-em').doc(email).set(
            userModel.tojson());
        emit(AuthSuccess());
        return userCredential.user;
    }
        on FirebaseAuthException catch(e){
         emit(AuthFailure(e.toString()));

        }
  }
}
