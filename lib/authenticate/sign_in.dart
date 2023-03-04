import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo/main.dart';

class SignIn extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const SignIn({Key? key, required this.onClickedSignUp}) : super(key: key);

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
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

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
              //git remote add origin https://github.com/uttammagaju/todo.git
              height: 40,
            ),
            TextField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction
                    .next, //it pass the cruser to next text field
                decoration: InputDecoration(labelText: 'Email')),
            SizedBox(height: 4),
            TextField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: 'password'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              icon: Icon(Icons.lock_open, size: 32),
              label: Text(
                'Sign In',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: signIn,
            ),
            SizedBox(
              height: 24,
            ),
            RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    text: 'Do not have account? ',
                    children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignUp,
                      text: 'Sign Up',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secondary))
                ]))
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator()));
    //Asynchronous function is a function that returns the type of Future.
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
