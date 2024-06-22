import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuaibkhan2ndproject/MyDashboard.dart';

class AddData extends StatelessWidget {
  AddData({super.key});
  var addnotes=TextEditingController();
  User? user=FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Add Notes"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
                width: 500,
                child: TextField(
                  maxLines: 5,
                  controller: addnotes,
                  decoration: InputDecoration(
                    hintText: "Enter Your Notes",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                )
            ),

            SizedBox(height: 10,),

            ElevatedButton(onPressed: () {
              try{

                FirebaseFirestore.instance.collection("Notes").doc().set({
                  'MyNotes' : addnotes.text,
                  'UserId' : FirebaseAuth.instance.currentUser?.uid
                }).then((value){
                  print("Add Data Sucessfully");
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return MyDashboard();
                  },));
                });
              } on Exception catch(e){
                print(e);
                print("User Notes Founded");
              }

            } , child: Text("Submit Notes"))

          ],
        ),
      ),
    );
  }
}
