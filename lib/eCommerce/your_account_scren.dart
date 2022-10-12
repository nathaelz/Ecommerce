import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class YourAccountScreen extends StatelessWidget {
  const YourAccountScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your account',
              style: GoogleFonts.inter()
                  .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  'Name',
                  style: GoogleFonts.inter()
                      .copyWith(fontSize: 25, fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  'Email',
                  style: GoogleFonts.inter()
                      .copyWith(fontSize: 25, fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  'Password',
                  style: GoogleFonts.inter()
                      .copyWith(fontSize: 25, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
