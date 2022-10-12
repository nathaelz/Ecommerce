import 'package:flutter/material.dart';

 class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginView(context)
    );
  }

Widget _loginView(context){

  return Row(

    children: [
      Container(
        padding: EdgeInsets.all(64),
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('Welcome back!',style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                 SizedBox(height: 40,),
            Text('Email',textAlign: TextAlign.left, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
            Container(
              width: 400,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  
                ),
              ),
            ),
            SizedBox(height: 60,),
            Text('Password',textAlign: TextAlign.left, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
            Container(
              width: 400,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  
                ),
              ),
            )
              ],
            )
          ],
        )
      ),
      Container(
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          color: Colors.black
        ),

      ),
    ],

  );


}

}