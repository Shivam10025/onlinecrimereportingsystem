import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Gpname(){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 5.0 , right: 15.0 , top: 18.0 , bottom: 0.0),
        child: Center(
          child: Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.deepPurple, borderRadius: BorderRadius.circular(20)
            ),
            child: FlatButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: Text(
                'Register',
                style: GoogleFonts.sora(color: Colors.white , fontSize: 25),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 60.0 , right: 15.0 , top: 18.0 , bottom: 0.0),
        child: Center(
          child: Container(
            height: 50,
            width: 130,
            decoration: BoxDecoration(
                color: Colors.deepPurple, borderRadius: BorderRadius.circular(20)
            ),
            child: FlatButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: Text(
                'login',
                style: GoogleFonts.sora(color: Colors.white , fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
