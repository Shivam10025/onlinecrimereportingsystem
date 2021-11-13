import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
class ReportPortal extends StatefulWidget {
  const ReportPortal({Key? key}) : super(key: key);

  @override
  _ReportPortalState createState() => _ReportPortalState();
}

class _ReportPortalState extends State<ReportPortal> {
  TextEditingController namec = TextEditingController();
  TextEditingController mailc = TextEditingController();
  TextEditingController phonec = TextEditingController();
  TextEditingController pwdc = TextEditingController();
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
                    color: Colors.white.withOpacity(0.75),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            width: 400,
                            height: 50,
                            child: Text("Welcome",style: GoogleFonts.sora(color: Colors.deepPurple , fontSize: 22 , fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6.0 , bottom: 5.0),
                        child: Center(
                            child: Text("Log New Complain" , style: GoogleFonts.sora(color: Colors.deepPurple , fontSize: 22 , fontWeight: FontWeight.bold))
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0 , bottom: 0 , left: 15.0 , right: 15.0),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.deepPurple,
                         // controller: namec,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurple , width: 0.0)
                            ),
                            icon: new Icon(CupertinoIcons.book_solid),
                            border: OutlineInputBorder(),
                            labelText: "Aadhar Number",
                            labelStyle: GoogleFonts.sora(color: Colors.deepPurple),
                            hintText: "Aadhar Number : 1234567812352",
                            hintStyle: GoogleFonts.jetBrainsMono(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0 , bottom: 0 , left: 15.0 , right: 15.0),
                        child: TextField(
                          keyboardType: TextInputType.streetAddress,
                          cursorColor: Colors.deepPurple,
                         // controller: namec,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurple , width: 0.0)
                            ),
                            icon: new Icon(CupertinoIcons.location_solid),
                            border: OutlineInputBorder(),
                            labelText: "Location of Crime",
                            labelStyle: GoogleFonts.sora(color: Colors.deepPurple),
                            hintText: "Location of Crime",
                            hintStyle: GoogleFonts.jetBrainsMono(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0 , bottom: 0 , left: 15.0 , right: 15.0),
                        child: TextField(
                          keyboardType: TextInputType.streetAddress,
                          cursorColor: Colors.deepPurple,
                         // controller: namec,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurple , width: 0.0)
                            ),

                            icon: new Icon(CupertinoIcons.tropicalstorm),
                            border: OutlineInputBorder(),
                            labelText: "Type of Crime",
                            labelStyle: GoogleFonts.sora(color: Colors.deepPurple),
                            hintText: "Type of Crime",
                            hintStyle: GoogleFonts.jetBrainsMono(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0 , bottom: 0 , left: 15.0 , right: 15.0),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.deepPurple,
                        //  controller: namec,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurple , width: 0.0)
                            ),
                            icon: new Icon(CupertinoIcons.calendar_today),
                            border: OutlineInputBorder(),
                            labelText: "Date of Crime",
                            labelStyle: GoogleFonts.sora(color: Colors.deepPurple),
                            hintText: "Date : dd-mm-yyyy",
                            hintStyle: GoogleFonts.jetBrainsMono(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0 , bottom: 0 , left: 15.0 , right: 15.0),
                        child: TextField(
                          maxLines: 10,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.deepPurple,
                        //  controller: namec,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurple , width: 0.0)
                            ),
                            icon: new Icon(CupertinoIcons.chat_bubble_fill),
                            border: OutlineInputBorder(),
                            labelText: "Description",
                            labelStyle: GoogleFonts.sora(color: Colors.deepPurple),
                            hintText: "Describe the incident in details with time",
                            hintStyle: GoogleFonts.jetBrainsMono(),
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
                              if(namec.text.length<3){
                                  Fluttertoast.showToast(msg: "Name should be atleast 3 characters.");
                                }
                                else if(!mailc.text.contains("@")){
                                  Fluttertoast.showToast(msg: "Email is Incorrect");
                                }
                                else if(phonec.text.length==0){
                                  Fluttertoast.showToast(msg: "Phone Number is Mandatory");
                                }
                                else if(pwdc.text.length<6){
                                  Fluttertoast.showToast(msg: "Password must be atleast six digits");
                                }
                                else {
                                  //registernuse(context);
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
                              // Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                            },
                            child: Text(
                              "See Previous Complain",
                              style: GoogleFonts.sora(color: Colors.deepPurple, fontSize: 15),
                            ),
                          ),
                        ),
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
