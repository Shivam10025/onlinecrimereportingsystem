import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:onlinecrimereportingsystem/Screesns/login.dart';
import 'package:onlinecrimereportingsystem/Screesns/report.dart';

import 'home.dart';
class RegScreen extends StatefulWidget {
  //const RegScreen({Key? key}) : super(key: key);

  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  bool invisible = true;
  bool visible = false ;
  final name= TextEditingController();
  final mail = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final gender = TextEditingController();
  final address = TextEditingController();
  final aadhar = TextEditingController();
  void _togglePasswordView() {
    setState(() {
      invisible = !invisible;
    });
  }
  Future userRegistration(BuildContext context) async{
    setState(() {
      visible = true ;
    });
    String nm = name.text;
    String email = mail.text;
    String pwd = password.text;
    String ph = phone.text;
    String gd = gender.text;
    String ad = address.text;
    String adh = aadhar.text;

    // SERVER API URL
    var url = Uri.parse('https://ocmr.000webhostapp.com/signup.php');

    // Store all data with Param Name.
    var data = {'name': nm, 'phone' : ph , 'email': email, 'password' : pwd , 'address' : ad , 'aadhar' : adh , 'gender' : gd};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));
    // Getting Server response into variable.
    var message = jsonDecode(response.body);
    if(response.statusCode == 200){
      setState(() {
        visible = false;
      });
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
              },
            ),
          ],
        );
      },
    );
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
                              padding: EdgeInsets.only(top: 5.0),
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
                            padding: EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: Container(
                                width: 200,
                                height: 100,
                                child: Image.network('https://miro.medium.com/max/498/1*Es2vCEieszU7QQqsLChl6A.png'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 6.0 , bottom: 5.0),
                            child: Center(
                                child: Text("Register" , style: GoogleFonts.sora(color: Colors.deepPurple , fontSize: 16 , fontWeight: FontWeight.bold))
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.deepPurple,
                              controller: name,
                              autofocus: true,
                              autocorrect: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple , width: 0.0)
                                ),
                                icon: new Icon(CupertinoIcons.person_solid),
                                border: OutlineInputBorder(),
                                labelText: "Name",
                                labelStyle: GoogleFonts.sora(color: Colors.deepPurple),
                                hintText: "Enter Name",
                                hintStyle: GoogleFonts.jetBrainsMono(color: Colors.white.withRed(100)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0 , bottom: 0 , left: 15.0 , right: 15.0),
                            child: TextField(
                              cursorColor: Colors.deepPurple,
                              keyboardType: TextInputType.phone,
                              controller: phone,
                              autofocus: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple , width: 0.0)
                                ),
                                icon: new Icon(CupertinoIcons.phone_solid),
                                border: OutlineInputBorder(),
                                labelText: "Phone",
                                labelStyle: GoogleFonts.sora(color: Colors.deepPurple),
                                hintText: "Enter Phone",
                                hintStyle: GoogleFonts.jetBrainsMono(color: Colors.white.withRed(100)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0 , bottom: 0 , left: 15.0 , right: 15.0),
                            child: TextField(
                              cursorColor: Colors.deepPurple,
                              keyboardType: TextInputType.emailAddress,
                              autofocus: true,
                              style: TextStyle(color: Colors.white),
                              controller: mail,
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
                              autofocus: true,
                              style: TextStyle(color: Colors.white),
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
                            padding: EdgeInsets.only(top: 15.0 , bottom: 0 , left: 15.0 , right: 15.0),
                            child: TextField(
                              keyboardType: TextInputType.streetAddress,
                              cursorColor: Colors.deepPurple,
                              controller: address,
                              autofocus: true,
                              style: TextStyle(color: Colors.white),
                              autocorrect: true,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple , width: 0.0)
                                ),
                                icon: new Icon(CupertinoIcons.location_solid),
                                border: OutlineInputBorder(),
                                labelText: "Home Address",
                                labelStyle: GoogleFonts.sora(color: Colors.deepPurple),
                                hintText: "Home Address",
                                hintStyle: GoogleFonts.jetBrainsMono(color: Colors.white.withRed(100)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0 , bottom: 0 , left: 15.0 , right: 15.0),
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              autofocus: true,
                              cursorColor: Colors.deepPurple,
                              style: TextStyle(color: Colors.white),
                              controller: aadhar,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple , width: 0.0)
                                ),
                                icon: new Icon(CupertinoIcons.book_solid),
                                border: OutlineInputBorder(),
                                labelText: "Aadhar Number",
                                labelStyle: GoogleFonts.sora(color: Colors.deepPurple),
                                hintText: "Aadhar Number : 123456781235",
                                hintStyle: GoogleFonts.jetBrainsMono(color: Colors.white.withRed(100)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0 , bottom: 0 , left: 15.0 , right: 15.0),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.deepPurple,
                              autofocus: true,
                              controller: gender,
                              style: TextStyle(color: Colors.white),
                              autocorrect: true,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple , width: 0.0)
                                ),
                                icon: new Icon(CupertinoIcons.person_crop_rectangle_fill),
                                border: OutlineInputBorder(),
                                labelText: "Gender",
                                labelStyle: GoogleFonts.sora(color: Colors.deepPurple),
                                hintText: "Gender : Male , Female",
                                hintStyle: GoogleFonts.jetBrainsMono(color: Colors.white.withRed(100)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0 , right: 15.0 , top: 18.0 , bottom: 0.0),
                            child: Center(
                              child: Container(
                                height: 40,
                                width: 250,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple, borderRadius: BorderRadius.circular(20)
                                ),
                                child: FlatButton(
                                  onPressed: () {
                                    if(name.text.length<3){
                                      Fluttertoast.showToast(msg: "Name should be atleast 3 characters.");
                                    }
                                    else if(!mail.text.contains("@")){
                                      Fluttertoast.showToast(msg: "Email is Incorrect");
                                    }
                                    else if(phone.text.length==0){
                                      Fluttertoast.showToast(msg: "Phone Number is Mandatory");
                                    }
                                    else if(password.text.length<6){
                                      Fluttertoast.showToast(msg: "Password must be atleast six digits");
                                    }
                                    else if(address.text.length==0){
                                      Fluttertoast.showToast(msg: "address Can't be Null");
                                    }
                                    else if(gender.text.length!=4 && gender.text.length!=6){
                                      Fluttertoast.showToast(msg: "Enter valid Gender");
                                    }
                                    else if(aadhar.text.length!=12){
                                      Fluttertoast.showToast(msg: "Enter valid aadhar number");
                                    }
                                    else {
                                      userRegistration(context);
                                    }
                                    // Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
                                  },
                                  child: Text(
                                    'Create Account',
                                    style: GoogleFonts.sora(color: Colors.white , fontSize: 20),
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
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                                },
                                child: Text(
                                  "Already have account?Sign in",
                                  style: GoogleFonts.sora(color: Colors.deepPurple, fontSize: 10),
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
