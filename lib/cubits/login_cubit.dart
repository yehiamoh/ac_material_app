import 'package:ac_material_app/models/user_mode.dart';
import 'package:ac_material_app/screens/bottom_bar.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());


  Future<User?> login (String email, String password,BuildContext context)async{
    try{
      emit(LoginLoading());
      UserCredential userCredential= await FirebaseAuth.instance.signInWithEmailAndPassword(email:email, password: password);
      // try to remove the success login success
     // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>BottomNavScreen()), (route) => false);
      emit(LoginSucess());
      return userCredential.user;
    }
     catch(e){
      emit(LoginFailed(e.toString()));

    }
  }
}


