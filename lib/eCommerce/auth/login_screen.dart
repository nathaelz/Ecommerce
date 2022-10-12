import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sellar_e_commerce/eCommerce/services/service.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  final _emailformKey = GlobalKey<FormState>();
  final _passformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: _loginView(size),
    );
  }

  _loginView(Size size) {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.all(80),
            color: Colors.white,
            width: size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back!",
                  style: GoogleFonts.inter()
                      .copyWith(fontSize: 55, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Email",
                  style: GoogleFonts.inter()
                      .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _emailformKey,
                  child: TextFormField(
                    controller: _emailController,
                    style: TextStyle(fontSize: 35),
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor no deje el campo vacio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      border: InputBorder.none,
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Password",
                  style: GoogleFonts.inter()
                      .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _passformKey,
                  child: TextFormField(
                    obscureText: true,
                    controller: _passController,
                    style: TextStyle(fontSize: 35),
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor no deje el campo vacio';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      border: InputBorder.none,
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                InkWell(
                  onTap: () async {
                    if (_emailformKey.currentState.validate() &&
                        _passformKey.currentState.validate()) {
                      final isLogin =
                          await Provider.of<BEServices>(context, listen: false)
                              .loginUser(
                                  _emailController.text, _passController.text);
                      if (isLogin) {
                        Navigator.pushNamed(context, '/home');
                        showTopSnackBar(
                          context,
                          CustomSnackBar.success(
                            message: "Buen trabajo,  te logeaste exitosamente",
                          ),
                        );
                      } else {
                        showTopSnackBar(
                          context,
                          CustomSnackBar.error(
                            message: "Usuaria o clave incorrecta",
                          ),
                        );
                      }
                    }
                  },
                  child: Ink(
                    child: Container(
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      height: 70,
                      width: 600,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff20506580).withOpacity(0.5),
                                offset: Offset(0, 8),
                                blurRadius: 16,
                                spreadRadius: -4)
                          ],
                          color: Color(0xff3D27BE),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                )
              ],
            )),
        Container(
            decoration: BoxDecoration(color: Color(0xffF1F0Fb)),
            width: size.width / 2,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 100,
                  child: Image(
                      height: 300, image: AssetImage('assets/png/card.png')),
                ),
                Positioned(
                  top: 250,
                  right: 80,
                  child: Image(
                      height: 300, image: AssetImage('assets/png/bag.png')),
                ),
                Positioned(
                  bottom: 100,
                  left: 40,
                  child: Image(
                      height: 300, image: AssetImage('assets/png/gift.png')),
                ),
              ],
            )),
      ],
    );
  }
}
