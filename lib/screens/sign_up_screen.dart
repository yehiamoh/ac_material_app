import 'package:ac_material_app/cubits/auth_cubit.dart';
import 'package:ac_material_app/screens/bottom_bar.dart';
import 'package:ac_material_app/screens/log_in_screen.dart';
import 'package:ac_material_app/widgets/my_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is AuthLoading){
            Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          );
        }
        else if(state  is AuthFailure){
           ScaffoldMessenger(child: SnackBar(content:Text(state.message),backgroundColor: Colors.red,),);
        }
        else if(state is AuthSuccess){
        Future.delayed(Duration.zero,()=>  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>BottomNavScreen()), (route) => false));
        }

      },
      child :SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffF5F5F5),
          body: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                children: [
                   Padding(
                    padding:EdgeInsets.only(left: 20.w, top: 70.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Create\nnew account",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  ),
                   SizedBox(
                    height: 36.h,
                  ),
                   Padding(
                    padding: EdgeInsets.only(left: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "User Name",
                          style: TextStyle(
                              color: Color(0xff8F92A1),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(
                    height: 5.h,
                  ),
                  MyTextFormField(
                    controller: userNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please Enter a valid username";
                      }
                      return null;
                    },
                  ),
                   SizedBox(
                    height: 24.h,
                  ),
                   Padding(
                    padding: EdgeInsets.only(left: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                              color: Color(0xff8F92A1),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(
                    height: 5.h,
                  ),
                  MyTextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                   SizedBox(
                    height: 24.h,
                  ),
                   Padding(
                    padding: EdgeInsets.only(left: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "password",
                          style: TextStyle(
                              color: Color(0xff8F92A1),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(
                    height: 5.h,
                  ),
                  MyTextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 8) {
                        return "password must contains at least 8 characters";
                      }
                      return null;
                    },
                  ),
                   SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    height: 50.h,
                    width: 330.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0.sp),
                      color: const Color(0xff1B08DA), // Background color
                    ),
                    child: TextButton(
                      onPressed: () async{
                        key.currentState!.save();
                        if (key.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).Auth(userNameController.text, emailController.text, passwordController.text);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.transparent), // Make button transparent
                        padding: MaterialStateProperty.all(
                             EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h)), // Adjust padding as needed
                      ),
                      child:  Text(
                        "Signup",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        "Already have an account",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>LoginScreen()), (route) => false);
                          },
                          child:Text(
                            "Login",
                            style: TextStyle(
                                color: Color(0xff1B08DA),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
