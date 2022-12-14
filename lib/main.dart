import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sellar_e_commerce/eCommerce/auth/register_screen.dart';
import 'package:sellar_e_commerce/eCommerce/your_account_scren.dart';
import 'package:sellar_e_commerce/widget_tree.dart';

import 'eCommerce/app_provider.dart';
import 'eCommerce/auth/login_screen.dart';
import 'eCommerce/services/service.dart';
import 'eCommerce/shopping_cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BEServices()),
          ChangeNotifierProvider(create: (_) => AppProvider()),
        ],
        child: MaterialApp(
          routes: {
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
            '/account': (context) => YourAccountScreen(),
            '/checkout': (context) => ShoppingCartScreen(),
            '/home': (context) => WidgetTree(),
          },
          debugShowCheckedModeBanner: false,
          title: 'Sellar eCommerce',
          theme: ThemeData(
              primaryColor: Color(0xFF283C63),
              accentColor: Color(0xFFE7E9F5),
              iconTheme: IconThemeData(color: Colors.black.withOpacity(0.4))),
          home: WidgetTree(),
        ));
  }
}
