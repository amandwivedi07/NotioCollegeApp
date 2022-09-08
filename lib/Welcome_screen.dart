import 'package:flutter/material.dart';
import 'package:notio/Widget/custom_textfield.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/logo.PNG',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(50),
                  //   topRight: Radius.circular(50),
                  // )
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 36),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Let’s get started',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Setting things up',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
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
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      items: _collection.map((String item) {
                                        return DropdownMenuItem(
                                            value: item, child: Text(item));
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
                ),
              ),
            ],
          ),
        ),
        persistentFooterButtons: [
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WelcomeScreen()));
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return AddressForm();
                    //     });
                  },
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(fontSize: 16),
                  )))
        ],
      ),
    );
  }
}
