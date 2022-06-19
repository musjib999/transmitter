import 'package:flutter/material.dart';
import 'package:transmitter/core/injector.dart';
import 'package:transmitter/module/screens/auth/login.dart';
import 'package:transmitter/module/screens/auth/signup.dart';
import 'package:transmitter/shared/widgets/primary_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff266BFF),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
          ),
        ),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'App Title',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'App Function',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        wordSpacing: 2,
                        color: Colors.white54,
                      ),
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      title: 'Log In',
                      onTap: () => si.routerService.nextRoute(
                        context,
                        const LoginScreen(),
                      ),
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      title: 'Sign Up',
                      onTap: () => si.routerService.nextRoute(
                        context,
                        const SignUpScreen(),
                      ),
                      color: Colors.transparent,
                      titleColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
