import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //Whenever the user modifies the text field, the controller notifies its listeners so
  //that they know the text and selection properties. TextEditingController also allows
  //you to modify the text and selection. In this case, the controller will notify the
  //text field so that it can update the view.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 236, 196),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 146, 66),
        title: Text("Sign in page to todo"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, //place all the children of Column widget in center as close as possible.
          children: [
            SizedBox(
              height: 40,
            ),
            TextField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Email')),
            SizedBox(height: 4),
            TextField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: 'password'),
            )
          ],
        ),
      ),
    );
  }
}
