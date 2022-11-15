// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

//import 'package:cahilog_midterm_exam/main.dart';
import 'package:cahilog_midterm_exam/home1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends StatefulWidget{
  const LoginPage ({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  @override
  Widget build(BuildContext context) {
return Container(
  decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green, Colors.yellow
                ],
              ),
            ),
  child:   Scaffold(
       backgroundColor: Colors.transparent,
    body: SafeArea(
  
      child: Center(
  
        child: SingleChildScrollView(
                  child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
               Image.asset(
                'assets/images/LogoJAG.png',
                height: 150,
                width: 150,
              ),
          // Jaguars Esports
  
            Text(
              'Jaguars Esports',
            style: GoogleFonts.bebasNeue(
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
            ),
            SizedBox(height: 20),
  
          // user.textfield
  
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
  
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'UserName',
                      prefixIcon: Icon(Icons.people),
                    ),
                  ),
                ),
              ),
            ),
  
            SizedBox(height: 10),
  
  
  
          // password.textfield
  
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
  
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'PassWord',
                      prefixIcon: Icon(Icons.password),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

  
  
          // sign-in button
  
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => Home1()),
                  );
                },
                    minWidth: double.infinity,
                    height: 60,
                    child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                    ),
  
                  child: Center(
                    child: Text('Sign In',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ),
              ),
            ),
            SizedBox(height: 10),
  
  
  
          // not a member? register now
  
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    ),
                  ),
  
                Text(
                  ' Register Now',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
            ],
          ),
        ),
      ),
    ),
  ),
);
}
}