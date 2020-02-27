import 'package:flutter/material.dart';
import 'package:flutter_lottery/app/bet/bet_storage.dart';
import 'package:flutter_lottery/app/checkout/checkout_screen.dart';
import 'package:flutter_lottery/app/checkout/checkout_storage.dart';
import 'package:flutter_lottery/app/common/repositories/mega_repository.dart';
import 'package:flutter_lottery/app/common/repositories/repository.dart';
import 'package:flutter_lottery/app/common/states/cart_storage.dart';
import 'package:flutter_lottery/app/home/home_screen.dart';
import 'package:flutter_lottery/res/routes.dart';
import 'package:provider/provider.dart';
import 'bet/bet_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Repository>(
          create: (_) => MegaRepository(),
        ),
        Provider<CartStorage>(
          create: (_) => CartStorage(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mega-Sena',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.home,
        routes: {
          Routes.home: (context) => HomeScreen(),
          Routes.bet: (context) => Provider(
                create: (context) =>
                    BetStorage(Provider.of<Repository>(context, listen: false)),
                child: BetScreen(),
              ),
          Routes.checkout: (_) => Provider(
                create: (_) => CheckoutStorage(),
                child: CheckoutScreen(),
              ),
        },
      ),
    );
  }
}
