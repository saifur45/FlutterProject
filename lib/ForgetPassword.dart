import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuaibkhan2ndproject/LoginPage.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  var forgetpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: forgetpassword,

                decoration:InputDecoration(
                  hintText: 'Enter Your Email',
                  prefixIcon: Icon(Icons.email,color: Colors.pink,),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.amber
                      )
                  ),
                  focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.red
                      )
                  ),
                ) ,
              ),
            ),

            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(400)
                  )),
                  onPressed: () {
                    FirebaseAuth.instance.sendPasswordResetEmail(email: forgetpassword.text).then((value){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return LoginScreen();
                      }));


                    });

                  }, child: Text("Submit")),
            ),
          ],
        ),
      )
    );
    
  }
}
