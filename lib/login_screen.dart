import 'package:flutter/material.dart';

import 'Welcome_screen.dart';
import 'Widget/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Welcome back',
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        'Sign in with your account',
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      SizedBox(
        height: 25,
      ),
      Form(
        key: _formKey,
        child: Column(children: [
          CustomTextField(
            controller: emailController,
            labelText: 'User Name',
            icon: Icons.person_outline,
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: passwordController,
            labelText: 'Password',
            icon: Icons.lock_outline,
            textType: TextInputType.visiblePassword,
          ),
        ]),
      ),
      SizedBox(
        height: 30,
      ),
      // Expanded(child: SizedBox()),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                minimumSize: Size(double.infinity, 50)),
            child: Text(
              'LOGIN',
              style: TextStyle(fontSize: 16),
            )),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Forgot your password?',
            style: TextStyle(color: Color(0xff2D4379)),
          ),
          TextButton(onPressed: () {}, child: Text('Reset here'))
        ],
      ),
    ]);
  }
}
