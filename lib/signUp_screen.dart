import 'package:flutter/material.dart';
import 'package:notio/Widget/custom_textfield.dart';

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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 36),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Let’s get started',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
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
              CustomTextField(
                controller: nameController,
                labelText: 'Full Name',
                icon: Icons.person_outline,
              ),
              CustomTextField(
                controller: mobileController,
                labelText: 'Mobile Number',
                icon: Icons.phone,
                textType: TextInputType.number,
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
              CustomTextField(
                controller: nameController,
                labelText: 'E-mail',
                icon: Icons.email_outlined,
                textType: TextInputType.emailAddress,
              ),
              CustomTextField(
                controller: nameController,
                labelText: 'Password',
                icon: Icons.lock_outline,
                textType: TextInputType.visiblePassword,
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
