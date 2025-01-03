import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insura_ease/provider/product_provider.dart';
import 'package:insura_ease/provider/subscription_provider.dart';
import 'package:insura_ease/themes/theme_provider.dart';
import 'package:insura_ease/ui/auth/login.dart';
import 'package:provider/provider.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => SubscriptionProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'InsuraEase',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignInPage()
        //home: MainScreen(),
      ),
    );
  }
}















