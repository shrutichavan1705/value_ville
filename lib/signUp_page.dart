import 'package:flutter/material.dart';
import 'package:value_ville/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:value_ville/firebase_options.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:value_ville/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:value_ville/Dashboard.dart';




void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class Myapp extends StatelessWidget {
  Myapp () {
    firebaseConfigure();
  }

  void firebaseConfigure() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUpPage(),
    );
  }
}
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController uname = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController cpass = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Value-Ville"),
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          height: 800,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              Image(
                image: AssetImage('assets/value-ville-login.jpg'),
                height: 200,
                width: 300,
              ),
              Container(
                margin: EdgeInsets.only(left:20,right: 20,bottom: 10),
                child: TextField(
                  controller: uname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    labelText: "Username",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left:20,right: 20,bottom: 10),
                child: TextField(
                  controller: pass,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      labelText: "Password",
                      isDense: true
                  ),
                  obscureText: true,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left:20,right: 20,bottom: 20),
                child: TextField(
                  controller: cpass,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      labelText: "Confirm Password",
                      isDense: true
                  ),
                  obscureText: true,
                ),
              ),
              ElevatedButton(
                onPressed: () async{

                  String un = uname.text.toString();
                  String p = pass.text.toString();
                  String cp = cpass.text.toString();

                  if(un.isEmpty || p.isEmpty || cp.isEmpty){
                    Fluttertoast.showToast(msg: "Fill all details!");
                  }else{
                    // bool isValidEmail = EmailValidator.validate(un);
                    // if(!isValidEmail){
                    //   Fluttertoast.showToast(msg: "Inavalid Email!");
                    // }
                    if(p.length < 6 || cp.length < 6 || (p.length < 6 && cp.length < 6)){
                      Fluttertoast.showToast(msg: "Password must be greater than 6!");
                    }else{
                      if(p != cp){
                        Fluttertoast.showToast(msg: "Passwords are not matching!");
                      }
                      else{
                        signUp();
                      }
                    }
                  }

                },
                child: Text("Sign Up"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade300,
                    foregroundColor: Colors.white,
                    padding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              )
            ],
          ),
        ),
      ),
    );
  }

  // bool validateEmail(String email) {
  //   // Regular expression for standard email format
  //   String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  //   RegExp regExp = new RegExp(emailPattern);
  //   return regExp.hasMatch(email);
  // }


  void signUp() async{
    try {
      var emailAddress = uname.text.toString()+"@gmail.com";
      // print(emailAddress);
      var password = pass.text.toString();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      print('Created');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
        print('The password provided is too weak.');
      }
      else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: "The account already exists for that email.");
        print('The account already exists for that email.');
      }else{

        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

       // List<String> emailParts = uname.toString().split('@');
        //String username = emailParts[0];
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => DashboardPage(uname: emailParts[0])));
       // print('abb');

        // Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
    uname.text = "";
    pass.text = "";
    cpass.text = "";
  }
}