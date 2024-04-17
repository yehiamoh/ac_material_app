import 'dart:io';

import 'package:ac_material_app/models/user_mode.dart';
import 'package:ac_material_app/screens/log_in_screen.dart';
import 'package:ac_material_app/screens/sign_up_screen.dart';
import 'package:ac_material_app/screens/splash_for_loged_in.dart';
import 'package:ac_material_app/widgets/simple_link_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<UserModel> fetchUserName() async {
    var userName = await FirebaseFirestore.instance
        .collection('user-em')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();

    return UserModel.fromJson(userName.data() as Map<String, dynamic>);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchUserName(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("error");
          } else if (snapshot.hasData) {
            String? name = snapshot.data!.name;
            return SafeArea(
                child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome $name",style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700
                      ),
                      maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),

                  
                  ExpansionTile(title: Text("About Us",style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600
                  ),),
                  
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Eng/yehia Mohamed"),
                            SimpleLinkWidget(linkUrl: "https://github.com/yehiamoh"),
                            SimpleLinkWidget(linkUrl: "https://www.linkedin.com/in/yehia-mohamed-9b86b524b/")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Eng/Youssif ibrahim "),
                            SimpleLinkWidget(linkUrl: "https://github.com/yehiamoh"),
                            SimpleLinkWidget(linkUrl: "https://www.linkedin.com/in/youssifibrahiim/")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("Special Thank for \nEng/Mohamed zahran\nfor backend services",overflow: TextOverflow.ellipsis,maxLines: 3,style: TextStyle(
                                  fontSize: 12.sp
                                ),),
                              ],
                            ),
                            SimpleLinkWidget(linkUrl: "https://github.com/ZAHRAN88"),
                            SimpleLinkWidget(linkUrl: "https://www.linkedin.com/in/mohamed-zahran-383859222/")
                          ],
                        ),

                      ],
                    )
                  ],
                  ),
                  SizedBox(height: 20.h,),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(19.w, 0, 0, 0),
                    child: GestureDetector(
                      onTap: () async {
                        try {
                          await FirebaseAuth.instance.signOut();
                         // exit(0);
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SignUpScreen()));
                        } catch (error) {
                          // Handle error gracefully, e.g., display a snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Logout failed: $error'),
                            ),
                          );
                        }

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.logout,
                            size: 22.sp,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  )

                  
                ],
              ),
            ));
          }
          return Text("error");
        });
  }
}


