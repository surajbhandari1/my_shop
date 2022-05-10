import 'package:my_shop/app/app.router.dart';
import 'package:my_shop/app/locator.dart';
import 'package:my_shop/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(AssetConstants.splashScreenBackground), context);
    return MaterialApp(
      title: 'My Shop',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      // home: CheckoutView(),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}    
