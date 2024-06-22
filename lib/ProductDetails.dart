import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';

class ProductDetails extends StatelessWidget {
  var product_id;
  var width=double.infinity;
  var height=double.infinity;
   ProductDetails(this.product_id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ProductDetails"),
      ),
body: StreamBuilder(stream: FirebaseFirestore.instance.collection('Products').where("Id",isEqualTo:product_id).snapshots(),
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
        var Image=snapshot.data?.docs[index]["Image"];
        var Name=snapshot.data?.docs[index]["Name"];
        var Price=snapshot.data?.docs[index]["Price"];
       // var Rating=snapshot.data?.docs[index]["Rating"];
        var Description=snapshot.data?.docs[index]["Description"];
       // var ProductId=snapshot.data?.docs[index].id;
        return  FillImageCard(
         // heightImage: 200,
          width: double.infinity,
          imageProvider: CachedNetworkImageProvider(Image),

          title: Center(child: Text("Product Name:$Name",style: TextStyle(fontWeight: FontWeight.bold),)),
          description:Center(child: Text("Product Price:$Price",style: TextStyle(fontWeight: FontWeight.bold),)),
          footer: Center(child: Text("Product Description:$Description",style: TextStyle(fontWeight: FontWeight.bold),)),
        );
      },);




    }



  return Container();
  },




),
     


    );
  }
}
