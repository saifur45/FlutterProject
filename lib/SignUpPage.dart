import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tuaibkhan2ndproject/LoginPage.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
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
                    child: Text("SIGN UP",style: TextStyle(color: Colors.white,fontSize:40 ),),
                  )
                ],

              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                             FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text).then((value){


                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                 SnackBar(content: Text("User Created Successfully"));
                                 return LoginScreen();
                               }));





                             });

                            }, child: Text("SIGN UP",style: TextStyle(Colors.black),)),
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                          onTap: () {

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            },));
                          },
                          child: Text("Already Have an account??...Login",
                            style: TextStyle(color: Colors.pink),)),
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