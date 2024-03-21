import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:value_ville/demo.dart';

import 'main.dart';

void main() {
  runApp(DashboardPage(uname: ""));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: "Dashboard",
//       home: DashboardPage(uname: "",),
//     );
//   }
// }

class DashboardPage extends StatefulWidget {
  final String uname;
  const DashboardPage({Key? key, required this.uname});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        leading: null,
        title: Row(
          children: [
            Text("Value-Ville"),
            Spacer(),
            IconButton(onPressed: () async{
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            }
            , icon: Icon(Icons.logout))
          ],
        ),

      ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.only(left: 30,right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              // scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.only(top: 15, bottom: 40),
                child: SizedBox(
                    width: 330,
                    height: 180,
                    child: Container(
                      color: Colors.white30,
                      padding: EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          Opacity(
                              opacity: 0.9,
                              child: Image(
                                image: AssetImage('assets/dashbimg1.jpg'),
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 50, left: 200),
                            child: Text(
                              "Welcome "+widget.uname+" !",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ),
            Column(
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    width: 270,
                    height: 130,
                    // decoration:
                    //     BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                        },
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('assets/svDashimg.jpg'),
                                // width: 50,
                                // height: 50,
                              ),
                              Text(
                                "   Social Values",
                                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),
                              )
                            ],
                          ),
                        ))),
                Container(
                    margin: EdgeInsets.all(10),
                    width: 270,
                    height: 130,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                        },
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('assets/pvDashimg.jpg'),
                                // width: 50,
                                // height: 50,
                              ),
                              Text("Personal Values",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18))
                            ],
                          ),
                        ))),
                Container(
                    margin: EdgeInsets.all(10),
                    width: 270,
                    height: 130,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                        },
                        child: Container(
                          color: Colors.white,
                          child: Stack(
                            children: [
                              Image(
                                image: AssetImage('assets/ivDashimg.jpg'),
                                // width: 50,
                                // height: 50,
                              ),
                              Positioned(
                                top: 45,
                                  left: 150,
                                  child:  Text(
                                "Interpersonal\nValues",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),
                                textAlign: TextAlign.center,
                              ))

                            ],
                          ),
                        ))),
                Container(
                    margin: EdgeInsets.all(10),
                    width: 270,
                    height: 130,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                        },
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('assets/evDashimg.jpg'),
                                // width: 50,
                                // height: 50,
                              ),
                              Text("Environment\nValues",textAlign:  TextAlign.center,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18))
                            ],
                          ),
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
