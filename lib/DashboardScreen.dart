import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuaibkhan2ndproject/LoginPage.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> data = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grapes',
    'Honeydew',
    'Kiwi',
    'Lemon',
  ];
  List<String> searchResults = [];
  String query = '';

  void onQueryChanged(String newQuery) {
    setState(() {
      query = newQuery;
      searchResults = data
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),),
                        gradient: LinearGradient(
                            colors: [
                              Color(0xffFF7F50),
                              Color(0xffDE3163)


                            ]
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("WELCOME TO DASHBOARD ADMIN",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: onQueryChanged,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                shrinkWrap: true,
                itemCount: searchResults.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image:
                              NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSThUethjmb-2LgWaeos35CTTjlAGy_FJnmCA&usqp=CAU')
                          )

                      ),
                      child:Center(child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Text(searchResults[index],style: TextStyle(color: Colors.white,fontSize: 20),),
                      )),
                    ),
                  );
                },),
              // ListView.builder(
              //   itemCount: searchResults.length,
              //   itemBuilder: (context, index) {
              //     return ListTile(
              //       title: Text(searchResults[index]),
              //     );
              //   },
              // ),
            ],
          ),
        ),



      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(accountName: Text("HassanKhanAfridi"),
              accountEmail:Text("HassanChingari@gmail.com"),currentAccountPicture:
              FittedBox(
                fit: BoxFit.cover,
                child: CircleAvatar(backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnNmSYpaGC3xakijlLsJpVi6gGLW0PQ6wiIQ&usqp=CAU'),
                  maxRadius: 50,
                ),
              ),

            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.hospitalUser,size: 20),
              title: Text("Admin Pannel"),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.cartShopping,size: 20),
              title: Text("Shopping Cart and Checkout"),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.history,size: 20),
              title: Text("Order History and Tracking"),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.handsHelping,size: 20),
              title: Text("FeedBack and Support"),
            ),
            GestureDetector(
              onTap: (){
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return LoginScreen();
                }));
              },
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.signOut,size: 20),
                title: Text("SignOut"),
              ),
            ),

          ],
        ),
      ) ,


    );
  }
}