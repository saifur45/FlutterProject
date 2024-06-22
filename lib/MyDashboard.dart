
import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuaibkhan2ndproject/AddData.dart';


class MyDashboard extends StatefulWidget {

  MyDashboard();

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  var editnotes=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Dashboard"),

        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: StreamBuilder(stream: FirebaseFirestore.instance.collection("Notes")
            .where("UserId",isEqualTo: FirebaseAuth.instance.currentUser?.uid).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {

            if(snapshot.hasError){
              print("SomeThing went Wrong");
            }
            if(snapshot.connectionState==ConnectionState.waiting){
              return CupertinoActivityIndicator();
            }
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  String usernotes=snapshot.data?.docs[index]["MyNotes"];
                  var userid=snapshot.data?.docs[index]["UserId"];
                  var docid=snapshot.data?.docs[index].id;

                  return ListTile(
                    title: Text(userid),
                    subtitle: Text(usernotes),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDialog(context: context, builder: (context) {
                                return AlertDialog( title: Text("Edit "),
                                  backgroundColor: Colors.white,
                                  actions: [
                                    Container(
                                        color: Colors.black26,
                                        width: 500,
                                        child: TextField(
                                          controller:   editnotes..text=usernotes,
                                          decoration: InputDecoration(
                                            hintText: 'Enter Your Notes',
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                          ),
                                        )
                                    ),
                                    ElevatedButton(onPressed: () {
                                      setState(() async {
                                        await FirebaseFirestore.instance.collection("Notes").doc(docid).update(
                                            {
                                              'MyNotes':editnotes.text
                                            }
                                        ).then((value) {

                                          print("Notes Updated");
                                          Navigator.of(context).pop();

                                        });
                                      });
                                    }, child: Text("Submit"))

                                  ],
                                );
                              },);

                            },
                            child: Icon(Icons.edit)

                        ),
                        GestureDetector(
                            onTap: () async{
                              await FirebaseFirestore.instance.collection("Notes").doc(docid).delete().then((value){
                                print("Record Deleted Sucessfully");

                              } );
                            },
                            child: Icon(Icons.delete)


                        ),
                      ],
                    ),
                  );

                },

              );
            }

            return Container();
          },

        ),



      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return AddData();
          },));
        },child: Icon(Icons.add),

      ),

    );
  }
}
