
import 'dart:js_interop';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_card/image_card.dart';
import 'package:tuaibkhan2ndproject/AddData.dart';
import 'package:tuaibkhan2ndproject/MyDashboard.dart';
import 'package:tuaibkhan2ndproject/ProductDetails.dart';


class Products extends StatefulWidget {
  Products({super.key});

  @override
  State<Products> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<Products> {

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
        child: StreamBuilder(stream: FirebaseFirestore.instance.collection("Products")
            .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {

            if(snapshot.hasError){
              print("SomeThing went Wrong");
            }
            if(snapshot.connectionState==ConnectionState.waiting){
              return CupertinoActivityIndicator();
            }
            if(snapshot.hasData){
              return GridView.builder(

                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  var Image=snapshot.data?.docs[index]["Image"];
                  var Name=snapshot.data?.docs[index]["Name"];
                  var Price=snapshot.data?.docs[index]["Price"];
                  var Rating=snapshot.data?.docs[index]["Rating"];
                  var ProductId=snapshot.data?.docs[index].id;

                   return GestureDetector(
                     onTap: () {
                       Navigator.push(context,MaterialPageRoute(builder: (context) {
                         print(Price);
                         return ProductDetails(ProductId);
                       },));
                     },
                     child: Padding(
                       padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
                       child: FillImageCard(
                         width: double.infinity,
                        heightImage: 240,
                         height: 200,

                         imageProvider: CachedNetworkImageProvider(Image),

                         title: Center(child: Text(Name)),
                         description:Center(child: Text(Price)),
                         footer: Center(child: Text(Rating)),
                       ),
                     ),
                   );


                }, gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 380,mainAxisSpacing: 30,crossAxisSpacing: 30),

              );
            }

            return Container();
          },

        ),



      ),


    );
  }
}
