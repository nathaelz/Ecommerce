import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sellar_e_commerce/widget_tree.dart';

import 'eCommerce/auth/login_screen.dart';
import 'eCommerce/services/service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => BEServices())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sellar eCommerce',
        theme: ThemeData(
            primaryColor: Color(0xFF283C63),
            accentColor: Color(0xFFE7E9F5),
            iconTheme: IconThemeData(color: Colors.black.withOpacity(0.4))),
        home: WidgetTree(),
      ),
    );
  }
}
