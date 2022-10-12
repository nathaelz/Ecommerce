import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sellar_e_commerce/eCommerce/services/service.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _confrimPassController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  final _emailformKey = GlobalKey<FormState>();
  final _passformKey = GlobalKey<FormState>();
  final _confirmpassformKey = GlobalKey<FormState>();
  final _nameformKey = GlobalKey<FormState>();

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
            padding: EdgeInsets.all(60),
            color: Colors.white,
            width: size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register",
                  style: GoogleFonts.inter()
                      .copyWith(fontSize: 55, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Full Name",
                  style: GoogleFonts.inter()
                      .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _nameformKey,
                  child: TextFormField(
                    style: TextStyle(fontSize: 25),
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor no deje el campo vacio';
                      }
                      return null;
                    },
                    controller: _nameController,
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
                  height: 15,
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
                    style: TextStyle(fontSize: 25),
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor no deje el campo vacio';
                      }
                      return null;
                    },
                    controller: _emailController,
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
                  height: 15,
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
                    style: TextStyle(fontSize: 25),
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor no deje el campo vacio';
                      } else if (_confrimPassController.text !=
                          _passController.text) {
                        return 'Las claves no coinciden';
                      } else if (value.length < 6) {
                        _confrimPassController.clear();
                        _passController.clear();
                        return "La clave debe ser mayor a 6 digitos";
                      }
                      return null;
                    },
                    controller: _passController,
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
                  height: 15,
                ),
                Text(
                  "Repeat Password",
                  style: GoogleFonts.inter()
                      .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _confirmpassformKey,
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(fontSize: 25),
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor no deje el campo vacio';
                      } else if (_confrimPassController.text !=
                          _passController.text) {
                        return 'Las claves no coinciden';
                      } else if (value.length < 6) {
                        return "La clave debe ser mayor a 6 digitos";
                      }
                      return null;
                    },
                    controller: _confrimPassController,
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
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      if (_nameformKey.currentState.validate() &&
                          _emailformKey.currentState.validate() &&
                          _passformKey.currentState.validate() &&
                          _confirmpassformKey.currentState.validate()) {
                        final isCreated = await Provider.of<BEServices>(context,
                                listen: false)
                            .createUser(
                                _nameController.text,
                                _emailController.text,
                                _passController.text,
                                _confrimPassController.text);
                        if (isCreated) {
                          Navigator.pushNamed(context, '/home');
                          showTopSnackBar(
                            context,
                            CustomSnackBar.success(
                              message:
                                  "Buen trabajo,  te registrate exitosamente",
                            ),
                          );
                        } else {
                          _confrimPassController.clear();
                          _passController.clear();
                          showTopSnackBar(
                            context,
                            CustomSnackBar.error(
                              message:
                                  "Este correo ya esta en uso, por favor escoga otro",
                            ),
                          );
                        }
                      }
                    },
                    child: Ink(
                      color: Colors.purple,
                      child: Container(
                        child: Center(
                          child: Text(
                            'Sign up',
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
