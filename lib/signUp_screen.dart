import 'package:flutter/material.dart';
import 'package:notio/Widget/custom_textfield.dart';

import 'Welcome_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String? college;

  final List<String> _collection = [
    'LU',
    'JYG',
    'Thapar',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Let’s get started',
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        'Setting things up',
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      Form(
        key: _formKey,
        child: Column(children: [
          CustomTextField(
            controller: userNameController,
            labelText: 'User Name',
            icon: Icons.person_outline,
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextField(
            controller: nameController,
            labelText: 'Full Name',
            icon: Icons.person_outline,
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextField(
            controller: mobileController,
            labelText: 'Mobile Number',
            icon: Icons.phone,
            textType: TextInputType.number,
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: double.infinity,
                child: DropdownButton(
                  hint: Text('Select University'),
                  value: college,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: _collection.map((String item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  onChanged: (String? newVal) {
                    setState(() {
                      college = newVal!;
                    });
                  },
                )),
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextField(
            controller: nameController,
            labelText: 'E-mail',
            icon: Icons.email_outlined,
            textType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextField(
            controller: nameController,
            labelText: 'Password',
            icon: Icons.lock_outline,
            textType: TextInputType.visiblePassword,
          ),
        ]),
      ),
      Expanded(child: SizedBox()),
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
              'SIGN UP',
              style: TextStyle(fontSize: 16),
            )),
      )
    ]);
  }
}
