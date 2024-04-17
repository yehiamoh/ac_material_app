import 'package:ac_material_app/cubits/login_cubit.dart';
import 'package:ac_material_app/firebase_helper/firebase_helper-auth.dart';
import 'package:ac_material_app/screens/bottom_bar.dart';
import 'package:ac_material_app/screens/sign_up_screen.dart';
import 'package:ac_material_app/screens/home_screen.dart';
import 'package:ac_material_app/widgets/my_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  FireBaseHelper firebase = FireBaseHelper();

  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSucess) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => BottomNavScreen()),
                (route) => false);
          } else if (state is LoginLoading) {
            Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is LoginFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message), backgroundColor: Colors.red));
          }
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xffF5F5F5),
            body: SingleChildScrollView(
              child: Form(
                key: key,
                child: Padding(
                  padding:  EdgeInsets.only(top: 100.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Log In",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                       SizedBox(
                        height: 36.h,
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
                            return "password must contains at least 8 charcters";
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
                          onPressed: () async {
                            key.currentState!.save();
                            if (key.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(context).login(
                                emailController.text,
                                passwordController.text,
                                context, // Pass context for error handling
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.transparent), // Make button transparent
                            padding: MaterialStateProperty.all(
                                 EdgeInsets.symmetric(
                                    horizontal: 16.w,vertical: 16.h)), // Adjust padding as needed
                          ),
                          child:  Text(
                            "Login",
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
                            "New to AC Materialapp!",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (_) => SignUpScreen()),
                                    (route) => false);
                              },
                              child: Text(
                                "Signup",
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
          ),
        ));
  }
}
