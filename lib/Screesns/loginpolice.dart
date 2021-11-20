import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:onlinecrimereportingsystem/Screesns/complainpincodetable.dart';
import 'package:onlinecrimereportingsystem/Screesns/loginhead.dart';
import 'package:onlinecrimereportingsystem/Screesns/regs.dart';

import 'home.dart';
class LoginPoliceScreen extends StatefulWidget {
 // const LoginPoliceScreen({Key? key}) : super(key: key);

  @override
  _LoginPoliceScreenState createState() => _LoginPoliceScreenState();
}

class _LoginPoliceScreenState extends State<LoginPoliceScreen> {
  bool invisible = true;
  bool visible = false ;
  final mail = TextEditingController();
  final password = TextEditingController();
  final pin = TextEditingController();
  void _togglePasswordView() {
    setState(() {
      invisible = !invisible;
    });
  }
  Future userRegistration(BuildContext context) async{
    setState(() {
      visible = true;
    });
    String email = mail.text;
    String pwd = password.text;
    var url = Uri.parse('https://ocmr.000webhostapp.com/loginpolice.php');
    var data = {'email': email, 'password' : pwd};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));
    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if(message == 'Login Matched')
    {// Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (_) => ComplainPin(pin.text)));
    }else{

      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Showing Alert Dialog with Response JSON Message.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
                alignment: Alignment.center,
                children: [
                  Hero(
                    tag: "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v1016-c-08_1-ksh6mza3.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=f584d8501c27c5f649bc2cfce50705c0",
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network("https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v1016-c-08_1-ksh6mza3.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=f584d8501c27c5f649bc2cfce50705c0" , fit: BoxFit.cover,)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0 , bottom: 0.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      width: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black87.withOpacity(0.2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Center(
                                child: IconButton(
                                  icon: Icon(CupertinoIcons.home , color: Colors.red,),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                                  },
                                ),
                              )
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Center(
                              child: Container(
                                width: 200,
                                height: 250,
                                child: Image.network('https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg?size=338&ext=jpg' ,),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.red.withGreen(100)
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0 , bottom: 5.0),
                            child: Center(
                                child: Text("Login as Officials" , style: GoogleFonts.sora(color: Colors.deepPurple , fontSize: 22 , fontWeight: FontWeight.bold))
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0 , bottom: 0 , left: 15.0 , right: 15.0),
                            child: TextField(
                              cursorColor: Colors.deepPurple,
                              keyboardType: TextInputType.emailAddress,
                              controller: pin,
                              autofocus: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple , width: 0.0)
                                ),
                                icon: new Icon(CupertinoIcons.mail_solid),
                                border: OutlineInputBorder(),
                                labelText: "Zip Code",
                                labelStyle: GoogleFonts.sora(color: Colors.deepPurple),
                                hintText: "Enter Zip Code i.e 283115",
                                hintStyle: GoogleFonts.jetBrainsMono(color: Colors.white.withRed(100)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0 , bottom: 0 , left: 15.0 , right: 15.0),
                            child: TextField(
                              cursorColor: Colors.deepPurple,
                              keyboardType: TextInputType.emailAddress,
                              controller: mail,
                              autofocus: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple , width: 0.0)
                                ),
                                icon: new Icon(CupertinoIcons.mail_solid),
                                border: OutlineInputBorder(),
                                labelText: "Email",
                                labelStyle: GoogleFonts.sora(color: Colors.deepPurple),
                                hintText: "Enter Email",
                                hintStyle: GoogleFonts.jetBrainsMono(color: Colors.white.withRed(100)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0 , bottom: 0 , left: 15.0 , right: 15.0),
                            child: TextField(
                              cursorColor: Colors.deepPurple,
                              obscureText: invisible,
                              controller: password,
                              style: TextStyle(color: Colors.white),
                              autofocus: true,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple , width: 0.0)
                                ),
                                icon: new Icon(CupertinoIcons.lock_circle_fill),
                                border: OutlineInputBorder(),
                                labelText: "Password",
                                labelStyle: GoogleFonts.sora(color: Colors.deepPurple),
                                hintText: "Enter Password",
                                hintStyle: GoogleFonts.jetBrainsMono(color: Colors.white.withRed(100)),
                                suffix: InkWell(
                                  onTap: _togglePasswordView,
                                  child: Icon(
                                    invisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.red.withBlue(100),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0 , right: 15.0 , top: 18.0 , bottom: 0.0),
                            child: Center(
                              child: Container(
                                height: 50,
                                width: 250,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple, borderRadius: BorderRadius.circular(20)
                                ),
                                child: FlatButton(
                                  onPressed: () {
                                    if(!mail.text.contains("@")){
                                      Fluttertoast.showToast(msg: "Email is Incorrect");
                                    }
                                    else if(password.text.length<6){
                                      Fluttertoast.showToast(msg: "Password must be atleast six digits");
                                    }
                                    else if(pin.text.length!=6){
                                      Fluttertoast.showToast(msg: "Enter A valid Pin code");
                                    }
                                    else {

                                      // Navigator.push(context, MaterialPageRoute(builder: (_) => RegScreen()));
                                      userRegistration(context);
                                    }
                                    // Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
                                  },
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.sora(color: Colors.white , fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0.0),
                            child: Center(
                              child: FlatButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => LoginHeadScreen()));
                                },
                                child: Text(
                                  "Login as Police Commissioner",
                                  style: GoogleFonts.sora(color: Colors.deepPurple, fontSize: 15 , fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                      visible: visible,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: CircularProgressIndicator()
                      )
                  ),
                ]
            )
          ],
        ),
      ),
    );
  }
}
