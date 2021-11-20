import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:onlinecrimereportingsystem/Screesns/chistory.dart';

import 'home.dart';
import 'login.dart';
class ReportPortal extends StatefulWidget {
  late String email;
  ReportPortal(this.email);
  //const ReportPortal({Key? key}) : super(key: key);
  @override
  _ReportPortalState createState() => _ReportPortalState();
}

class _ReportPortalState extends State<ReportPortal> {
  bool visible = false ;
  TextEditingController tc = TextEditingController();
  TextEditingController cc = TextEditingController();
  TextEditingController dc = TextEditingController();
  TextEditingController jc = TextEditingController();
  Future userRegistration(BuildContext context) async{
    setState(() {
      visible = true ;
    });
    String tcp = tc.text;
    String mail = widget.email;
    String ccp = cc.text;
    String dcp = dc.text;
    String jcp = jc.text;

    // SERVER API URL
    var url = Uri.parse('https://ocmr.000webhostapp.com/report.php');

    // Store all data with Param Name.
    var data = {'email' : mail , 'tc' : tcp , 'cc' : ccp , 'dc' : dcp , 'jc' : jcp};

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
                Navigator.push(context, MaterialPageRoute(builder: (_) => HistoryPortal(mail)));
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
                  alignment: Alignment.bottomCenter,
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
                        padding: EdgeInsets.only(top: 5.0),
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            width: 200,
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              //color: Colors.red,
                            ),
                            child: Image.network('https://vils.ai/includes/img/login-register.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6.0 , bottom: 5.0),
                        child: Center(
                            child: Text("Log New Complain" , style: GoogleFonts.sora(color: Colors.deepPurple , fontSize: 18 , fontWeight: FontWeight.bold))
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0 , bottom: 0 , left: 15.0 , right: 15.0),
                        child: TextField(
                          keyboardType: TextInputType.streetAddress,
                          cursorColor: Colors.deepPurple,
                          controller: cc,
                          autofocus: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurple , width: 0.0)
                            ),
                            icon: new Icon(CupertinoIcons.location_solid),
                            border: OutlineInputBorder(),
                            labelText: "Postel Zip Code",
                            labelStyle: GoogleFonts.sora(color: Colors.deepPurple),
                            hintText: "Postel Zip Code , 283115",
                            hintStyle: GoogleFonts.jetBrainsMono(color: Colors.white.withRed(100)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0 , bottom: 0 , left: 15.0 , right: 15.0),
                        child: TextField(
                          keyboardType: TextInputType.streetAddress,
                          cursorColor: Colors.deepPurple,
                          autofocus: true,
                          autocorrect: true,
                          style: TextStyle(color: Colors.white),
                          controller: tc,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurple , width: 0.0)
                            ),
                            icon: new Icon(CupertinoIcons.tropicalstorm),
                            border: OutlineInputBorder(),
                            labelText: "Type of Crime",
                            labelStyle: GoogleFonts.sora(color: Colors.deepPurple),
                            hintText: "Type of Crime",
                            hintStyle: GoogleFonts.jetBrainsMono(color: Colors.white.withRed(100)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0 , bottom: 0 , left: 15.0 , right: 15.0),
                        child: TextField(
                          keyboardType: TextInputType.datetime,
                          cursorColor: Colors.deepPurple,
                          autofocus: true,
                          controller: dc,
                          style: TextStyle(color: Colors.white),
                          onTap: () {
                            FocusScope.of(context).requestFocus(new FocusNode());
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2019, 1),
                              lastDate: DateTime(2021,12),
                            ).then((pickedDate){
                              setState(() {
                                dc.text = pickedDate.toString().substring(0 , 11);
                              });
                            });
                          },
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurple , width: 0.0)
                            ),
                            icon: new Icon(CupertinoIcons.calendar_today),
                            border: OutlineInputBorder(),
                            labelText: "Date of Crime",
                            labelStyle: GoogleFonts.sora(color: Colors.deepPurple),
                            hintText: "Date : dd-mm-yyyy",
                            hintStyle: GoogleFonts.jetBrainsMono(color: Colors.white.withRed(100)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0 , bottom: 0 , left: 15.0 , right: 15.0),
                        child: TextField(
                          maxLines: 6,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.deepPurple,
                          autofocus: true,
                          style: TextStyle(color: Colors.white),
                         controller: jc,
                          autocorrect: true,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurple , width: 0.0)
                            ),
                            icon: new Icon(CupertinoIcons.chat_bubble_fill),
                            border: OutlineInputBorder(),
                            labelText: "Description",
                            labelStyle: GoogleFonts.sora(color: Colors.deepPurple),
                            hintText: "Describe the incident in details with time",
                            hintStyle: GoogleFonts.jetBrainsMono(color: Colors.white.withRed(100)),
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
                                color: Colors.deepPurple, borderRadius: BorderRadius.circular(20),
                            ),
                            child: FlatButton(
                              onPressed: () {
                              if(cc.text.length!=6){
                                  Fluttertoast.showToast(msg: "Enter A valid Zip Code");
                                }
                                else if(tc.text.length==0){
                                  Fluttertoast.showToast(msg: "Enter type of crime is cumpolsory");
                                }
                                else if(dc.text.length==0){
                                  Fluttertoast.showToast(msg: "Date is Mandatory");
                                }
                                else if(jc.text.length<20){
                                  Fluttertoast.showToast(msg: "Description must be atleast 20 chars");
                                }
                                else {
                                  userRegistration(context);
                                }
                                // Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
                              },
                                child: Text(
                                    'Submit',
                                  style: GoogleFonts.sora(color: Colors.white , fontSize: 25),
                                ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                        child: Center(
                          child: FlatButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_) => HistoryPortal(widget.email)));
                            },
                            child: Text(
                              "See Previous Complain",
                              style: GoogleFonts.sora(color: Colors.deepPurple, fontSize: 15),
                            ),
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
                    ],
                  ),
              ),
              ),
            ],
          )
        ],
      ),
      ),
    );
  }
}
