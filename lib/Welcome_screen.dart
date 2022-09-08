import 'package:flutter/material.dart';
import 'package:notio/Widget/custom_textfield.dart';
import 'package:notio/login_screen.dart';
import 'package:notio/signUp_screen.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  late TabController tabcontroller;
  @override
  void initState() {
    super.initState();
    tabcontroller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

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
        // backgroundColor: Color(0xffE5E5E5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
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
                height: MediaQuery.of(context).size.height - 120,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      child: myTabBar(),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24.0, horizontal: 36),
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: tabcontroller,
                          children: [LoginScreen(), SignUpScreen()],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myTabBar() {
    return TabBar(
      // labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      unselectedLabelColor: Colors.white24,
      // indicator: BoxDecoration(
      //     borderRadius: BorderRadius.circular(12), color: Colors.orange),
      controller: tabcontroller,
      isScrollable: true,
      labelPadding: EdgeInsets.symmetric(horizontal: 30),
      tabs: [
        Tab(
          child: Text(
            'LOGIN',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        Tab(
          child: Text(
            'SIGNUP',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        )
      ],
    );
  }
}
