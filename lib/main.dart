import 'package:ac_material_app/cubits/auth_cubit.dart';
import 'package:ac_material_app/cubits/login_cubit.dart';
import 'package:ac_material_app/firebase_options.dart';
import 'package:ac_material_app/screens/log_in_screen.dart';
import 'package:ac_material_app/screens/sign_up_screen.dart';
import 'package:ac_material_app/screens/splash_for_loged_in.dart';
import 'package:ac_material_app/screens/splash_screen.dart';
import 'package:ac_material_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AuthCubit()),
        BlocProvider(create: (context)=>LoginCubit())
      ],
      child:ScreenUtilInit(
        designSize: const Size(360,690),
        builder: (context,child)=> MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashForLoggedIn()
        ),
      ),
    );
  }
}


// StreamBuilder(
// stream: FirebaseAuth.instance.authStateChanges(),
// builder:(context,snapshot){
// if (snapshot.data == null) {
// return const SplashScreen();
// }
// if (snapshot.hasData) {
// return const SplashForLoggedIn();
// }
// if (snapshot.connectionState == ConnectionState.waiting) {
// return const CircularProgressIndicator();
// }
// if (snapshot.hasError) {
// return const SnackBar(content: Text("error in loging in "));
// }
// return const Text('data');
// }
// ),