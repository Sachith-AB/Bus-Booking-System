import 'package:bus_booking/src/app/components/primary_button.dart';
import 'package:flutter/material.dart';
import '../../utils/color/colors.dart';
import '../../utils/constant.dart';
import '../components/primary_header.dart'; // Adjust path if needed

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage(
                            tLogo
                        ),
                        fit: BoxFit.cover,
                      )
                  ),
                  width: 500,
                  height: 500,
                ),
                const PrimaryHeader(
                  text: "Welcome to FoodStore",
                  size: 32,
                ),
                const SizedBox(height: 8),
                const Text(
                  "Let's get started by creating an account",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 40),
                PrimaryButton(
                  label: "Get Started",
                  onPressed: (){
                    Navigator.pushNamed(context, '/register');
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const PrimaryHeader(
                      text: 'Already have an account',
                      color: KColors.gray,
                      size: 16,
                      weight: FontWeight.w500,
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const PrimaryHeader(
                        text: "Login",
                        color: KColors.primaryColor,
                        size: 16,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
