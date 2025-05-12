import 'package:edahira/screens/membre_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xffffffff),
      body: Padding(
        padding: EdgeInsets.all(20),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Center(
              child: Image.asset("assets/edahira-logo.png",
                width: 250,
                height: 200,
              ),
            ),
            SizedBox(height: 100,),
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email, color: Color(0xFF22763D)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 50,),
            TextField(
              decoration: InputDecoration(
                labelText: "Mot de passe",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock,color: Color(0xFF22763D),),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MembreScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF22763D),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Se connecter",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                ),
            )
          ],
      )
      ),
    );
  }
}