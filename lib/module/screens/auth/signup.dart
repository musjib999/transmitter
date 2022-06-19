import 'package:flutter/material.dart';
import 'package:transmitter/core/injector.dart';
import 'package:transmitter/module/screens/auth/login.dart';
import 'package:transmitter/shared/theme/colors.dart';
import 'package:transmitter/shared/widgets/primary_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                onPressed: () => si.routerService.popRoute(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 80),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Create\nAccount',
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
                          controller: TextEditingController(),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person_outline),
                            hintText: 'Name',
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
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
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: const Icon(Icons.email_outlined),
                            suffixIcon: isEmailValid == true
                                ? const Icon(Icons.check)
                                : null,
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: TextEditingController(),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove_red_eye_outlined),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        PrimaryButton(
                          title: 'Sign Up',
                          onTap: () {},
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
                          title: 'Log In',
                          onTap: () => si.routerService.nextRoute(
                            context,
                            const LoginScreen(),
                          ),
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
