import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget BrandName(){
  return RichText(
    text: const TextSpan(
      style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w500),
      children: <TextSpan>[
        TextSpan(text: 'Citizen', style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black87)),
        TextSpan(text: 'Cop', style: TextStyle(fontWeight: FontWeight.bold , color: Colors.deepPurple)),
      ],
    ),
  );
}