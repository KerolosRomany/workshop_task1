import 'package:flutter/material.dart';

import '../components/components.dart';
import '../components/screen_size.dart';
import 'home_screen.dart';
import 'package:intl/intl.dart';


class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();

  var passwordController = TextEditingController();

  var birthdateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              print('Search');
            },
          )
        ],
        elevation: 0.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: ScreenSize.screenHeight * 0.03,
                  ),
                  TextFieldComponent(
                    label: 'Email',
                    controller: emailController,
                    picon: Icon(Icons.email_outlined),
                    validator: (value) {
                      bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]")
                          .hasMatch(value);
                      if (value.isEmpty) {
                        return 'please enter your email';
                      }
                      else if (!emailValid) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: ScreenSize.screenHeight * 0.03,
                  ),
                  TextFieldComponent(
                    label: 'Full name',
                    controller: nameController,
                    picon: Icon(Icons.person_outline),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: ScreenSize.screenHeight * 0.03,
                  ),
                  TextFieldComponent(
                    label: 'Password',
                    controller: passwordController,
                    isPassword: true,
                    picon: Icon(Icons.lock_outline_rounded),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'please enter your password';
                      }
                      else if (passwordController.text.length < 6){
                        return "Password should be more than 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: ScreenSize.screenHeight * 0.03,
                  ),
                  TextFieldComponent(
                      label: 'Birthdate',
                      controller: birthdateController,
                      picon: Icon(Icons.date_range),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please enter your birthdate';
                        }
                        return null;
                      },
                    onTap: () async {
                      var date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        birthdateController.text = DateFormat('dd/MM/yyyy').format(date);
                      }
                    },
                  ),
                  SizedBox(
                    height: ScreenSize.screenHeight * 0.03,
                  ),
                  defaultButton(
                    text: 'Signup',
                    onpressed: () {
                      if (formKey.currentState!.validate()) {
                        emailController.clear();
                        passwordController.clear();
                        nameController.clear();
                        birthdateController.clear();
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account ?'),
                      TextButton(onPressed: () {}, child: Text('Login')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

