import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

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
                TextFormField(
                  decoration: InputDecoration(
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
                TextFormField(
                  decoration: InputDecoration(
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
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: Container(
                    child: Center(
                      child: Text(
                        'Sing In',
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
                )
              ],
            )),
        Container(
            color: Color(0xffF1F0F2),
            width: size.width / 2,
            child: Stack(
              children: [
                Positioned(child: Image.asset('assets/png/Rectangle.png'))
              ],
            )),
      ],
    );
  }
}
