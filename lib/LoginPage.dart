import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tuaibkhan2ndproject/ForgetPassword.dart';
import 'package:tuaibkhan2ndproject/Products.dart';
import 'package:tuaibkhan2ndproject/SignUpPage.dart';

import 'DashboardScreen.dart';
import 'MyDashboard.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var email=TextEditingController();
  var password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xff3852d7),
                  Color(0xff2c97d2)



                ]
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(45.0),
                    child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize:40 ),),
                  )
                ],

              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: email,

                          decoration:InputDecoration(
                            hintText: 'Enter Your Email',
                            prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Colors.black
                                )
                            ),
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Colors.black
                                )
                            ),
                          ) ,
                        ),
                      ),//User email

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: password,
                        obscureText: true,
                          decoration:InputDecoration(
                            hintText: 'Enter Your Password',
                            prefixIcon: Icon(Icons.key,color: Colors.black,),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Colors.black
                                )
                            ),
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Colors.black
                                )
                            ),
                          ) ,
                        ),
                      ),//User Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right:15),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                  return ForgetPassword();


                                },));
                              },
                                child: Text("Forget Password??",style: TextStyle(color: Colors.black,fontSize:12))



                            ),
                          )
                        ],
                      ),//Forget Password text
                      SizedBox(height: 5,),
                      Container(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(400)
                            )),
                            onPressed: () {
                              FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text).then((value){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                  return  Products();
                                }));


                              });

                            }, child: Text("LOGIN",style: TextStyle(color: Colors.black),)),
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return SignUpScreen();
                            },));
                          },
                          child: Text("Dont Have an account ?? Create New",
                            style: TextStyle(color: Colors.black),)),
                      SizedBox(height: 10,)

                    ],
                  ),
                ),
              )




            ],



          ),
        ),



      ),

    );
  }
}