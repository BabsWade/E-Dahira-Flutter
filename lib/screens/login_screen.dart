import 'package:edahira/screens/membre_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'login.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen>{
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;

  //permet cibler chaque champ pour la validation
  final _formKey = GlobalKey<FormState>();

  //Dispose permet de liberer, de degager les controller
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: EdgeInsets.all(20),
        child:Form(
          key: _formKey,
          child: Column(
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
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email, color: Color(0xFF22763D)),
                  filled: true,
                  fillColor: Colors.white,
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre email';
                  }
                  return null;
                },
                controller: _emailController,
              ),
              SizedBox(height: 50,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Mot de passe",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock,color: Color(0xFF22763D),),
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Color(0xFF22763D),
                      )
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  }
                  return null;
                },
                controller: _passwordController,
                obscureText: !_passwordVisible,
              ),
              SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final username = _emailController.text;
                    final password = _passwordController.text;
                    final success = await login(username, password);
                    if (success){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Identifiants ou mot de passe incorrects",
                          style: TextStyle(
                            fontSize: 25,
                          )),
                            backgroundColor: Color(0xFF22763D)),
                      );
                    }
                  }
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

      )
      ),
    );
  }
}