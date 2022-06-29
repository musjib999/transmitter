import 'package:flutter/material.dart';
import 'package:transmitter/data/model/user_model.dart';
import 'package:transmitter/main.dart';
import 'package:transmitter/module/screens/auth/signup.dart';
import 'package:transmitter/module/screens/menus/turn_on_location.dart';
import 'package:transmitter/shared/global/global_var.dart';
import 'package:transmitter/shared/theme/colors.dart';
import 'package:transmitter/shared/widgets/primary_button.dart';

import '../../../core/injector.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isEmailValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 80),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Welcome\nBack',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 150),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        TextField(
                          controller: email,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: const Icon(Icons.email_outlined),
                            suffixIcon: isEmailValid == true
                                ? const Icon(Icons.check)
                                : null,
                          ),
                          onChanged: (String value) {
                            if (value.contains('@') && value.contains('.')) {
                              setState(() {
                                isEmailValid = true;
                              });
                            } else {
                              setState(() {
                                isEmailValid = false;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: password,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove_red_eye_outlined),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        PrimaryButton(
                          title: 'Log In',
                          onTap: () {
                            if (email.text == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please Enter Email',
                                  ),
                                ),
                              );
                            } else {
                              currentUser = UserModel(email: email.text);
                              si.routerService.nextRoute(
                                context,
                                const TurnOnLocation(),
                              );
                            }
                          },
                          hasBorder: false,
                          titleColor: Colors.white,
                          color: AppColors.primaryColor,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              width: 150,
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Or',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            SizedBox(width: 5),
                            SizedBox(
                              width: 150,
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        PrimaryButton(
                          title: 'Sign Up',
                          onTap: () {
                            si.routerService.nextRoute(
                              context,
                              const SignUpScreen(),
                            );
                          },
                          color: Colors.transparent,
                          titleColor: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
