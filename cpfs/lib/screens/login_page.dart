
import 'package:cpfs/components/my_button.dart';
import 'package:cpfs/components/my_textfield.dart';
import 'package:cpfs/components/square_tile.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}

  
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),

              // logo
              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(
                height: 50,
              ),

              //welcome back text

              Text(
                "Welcome back",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),

              const SizedBox(
                height: 25,
              ),

              //username textfield
              MytextField(
                controller: usernameController,
                hintName: 'Username',
                obscureText: false,
              ),

              const SizedBox(
                height: 25,
              ),
              //password textfield
              MytextField(
                  controller: passwordController,
                  hintName: 'Password',
                  obscureText: true),
              //forgot password
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //sign in button

              MyButton(
                onTap: signUserIn,
              ),
              const SizedBox(
                height: 25,
              ),

              //or continue with
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: "assets/images/google.png"),
                  SizedBox(
                    width: 25,
                  ),
                  SquareTile(imagePath: "assets/images/apple.png"),
                ],
              ),

              const SizedBox(
                height: 50,
              ),
              //google + apple sign in button

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Not a member?"),
                SizedBox(width: 4,),
                 Text("Register?", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)],
              )

              //not a member? register now
            ],
          ),
        ),
      ),
    );
  }
}
