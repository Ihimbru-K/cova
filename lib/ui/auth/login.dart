


import 'package:flutter/material.dart';
import 'package:insura_ease/ui/auth/signup.dart';
import 'package:insura_ease/ui/mainscreen.dart';

import '../../services/auth/auth_service.dart';

import '../../utils/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ///login method
  void login() async {
    // Get auth service
    final _authService = AuthService();

    // try to sign in user
    try {
      await _authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ));
    }



    // Navigate to HomePage after successful login
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>  MainScreen()));
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }






  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,

        ),


        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 17, right: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('lib/images/logo2.png',),

                const Center(child: Text("Hello, get started by entering your ", style: TextStyle(color: Colors.grey),),),
                const Center(child: Text("information", style: TextStyle(color: Colors.grey),), ),
                const SizedBox(height: 14,),
                CustomTextField(hintText: 'Enter your email', controller: emailController,),
                const SizedBox(height: 20,),
                CustomTextField(hintText: 'Enter your password', trailingIcon: Icons.remove_red_eye, controller: passwordController, ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [const Text("Forgot your password? Click "), InkWell(onTap: (){}, child: const Text("Here", style: TextStyle(color: AppColors.background1),),)],),
                const SizedBox(height: 21,),
                CustomButton(text: 'SIGN IN', width: screenWidth*0.9,  onTap: (){
                  login();
                },  ),
                const SizedBox(height: 31,),
                const  Text('------------ Or sign in with ------------'),
                const SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 2, right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          IconButton(onPressed: () {  }, icon: Image.asset('lib/images/google.png', scale: 2.2,),),
                          const  Text('Google', style: TextStyle(fontSize: 14),)
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 2, right: 6),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          IconButton(onPressed: () {  }, icon: Image.asset('lib/images/facebook.png', scale: 2.2,),),
                          const  Text('Facebook', style: TextStyle(fontSize: 13),)
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 2, right: 6),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          IconButton(onPressed: () {  }, icon: Image.asset('lib/images/twitter.png', scale: 1.5,),),
                          const  Text('Twitter', style: TextStyle(fontSize: 13),  )
                        ],
                      ),
                    )

                  ],),

                const SizedBox(height: 30,),

                Row
                  (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [const Text("Don't have an account?"), InkWell(child: const Text("Sign up", style: TextStyle(color: AppColors.background1),), onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()),);

                  },)], )
















              ],
            ),
          ),
        )



    );
  }
}
