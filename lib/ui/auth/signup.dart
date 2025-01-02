import 'package:flutter/material.dart';
import 'package:insura_ease/ui/mainscreen.dart';

import '../../services/auth/auth_service.dart';
import '../../utils/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  /// Register method
  void register() {
    final _authService = AuthService();

    // Check if passwords match before creating user
    if (passwordController.text == confirmPasswordController.text) {
      try {
        _authService.signUpWithEmailPassword(
            emailController.text, passwordController.text);

        // Navigate to HomePage after successful signup
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
      } catch (e) {
        // Display any errors
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      // Show error if passwords don't match
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('lib/images/logo2.png'),
              const Center(
                  child: Text(
                    "Create your account by filling out the information below",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  )),
              const SizedBox(height: 14),
              CustomTextField(
                hintText: 'Enter your email',
                controller: emailController,
              ),
              const SizedBox(height: 20),
              // Username and Phone fields side-by-side
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Enter username',
                      controller: usernameController,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Phone number',
                      controller: phoneController,
                      leadingIcon: Icons.phone,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Enter your password',
                trailingIcon: Icons.remove_red_eye,
                controller: passwordController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Confirm password',
                trailingIcon: Icons.remove_red_eye,
                controller: confirmPasswordController,
              ),
              const SizedBox(height: 21),
              CustomButton(
                text: 'SIGN UP',
                width: screenWidth * 0.9,
                onTap: () {
                  register();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
                },
              ),
              const SizedBox(height: 31),
              const Text('------------ Or sign up with ------------'),
              const SizedBox(height: 30),
              // Social login buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _socialLoginButton(
                      iconPath: 'lib/images/google.png', text: 'Google'),
                  _socialLoginButton(
                      iconPath: 'lib/images/facebook.png', text: 'Facebook'),
                  _socialLoginButton(
                      iconPath: 'lib/images/twitter.png', text: 'Twitter'),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context); // Navigate back to SignInPage
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(color: AppColors.background1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for social login buttons
  Widget _socialLoginButton({required String iconPath, required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(iconPath, scale: 2.2),
          ),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
