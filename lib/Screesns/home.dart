import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlinecrimereportingsystem/Screesns/loginpolice.dart';
import 'package:onlinecrimereportingsystem/Screesns/regs.dart';
import 'package:onlinecrimereportingsystem/widget/widget.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isScreenWide = MediaQuery.of(context).size.width >= 860;
    bool isScreen = MediaQuery.of(context).size.width >= 591;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v1016-c-08_1-ksh6mza3.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=f584d8501c27c5f649bc2cfce50705c0",
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network("https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v1016-c-08_1-ksh6mza3.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=f584d8501c27c5f649bc2cfce50705c0" , fit: BoxFit.cover,)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.0 , bottom: 5.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                        child: Text(isScreen ? "Welcome to Police Online FIR System" : "Welcome" , style: GoogleFonts.sora(color: Colors.white , fontSize: 30 , fontWeight: FontWeight.bold))
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.0 , bottom: 5.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Flex(
                          direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 0.0 , left:  0.0 , top: 0.0 , bottom: 5.0),
                              child: Center(
                                  child: Text("Have a Complain? " , style: isScreen ? GoogleFonts.roboto(color: Colors.yellow , fontSize: 50 , fontWeight: FontWeight.bold):GoogleFonts.roboto(color: Colors.yellow , fontSize: 35 , fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 0.0 , left:  0.0 , top: 0.0 , bottom: 0.0),
                              child: Container(
                                  child: Text("Login as a Official" , style: isScreen ? GoogleFonts.roboto(color: Colors.deepOrangeAccent , fontSize: 30 , fontWeight: FontWeight.bold): GoogleFonts.roboto(color: Colors.deepOrangeAccent , fontSize: 25 , fontWeight: FontWeight.bold))
                              ),
                            ),
                          ],
                        ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 70.0 , bottom: 5.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Flex(
                        direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: isScreenWide ? const EdgeInsets.only(left: 50.0 , right: 15.0 , top: 18.0 , bottom: 0.0) : const EdgeInsets.only(left: 5.0 , right: 15.0 , top: 18.0 , bottom: 0.0),
                            child: Center(
                              child: Container(
                                height: 50,
                                width: 300,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple, borderRadius: BorderRadius.circular(20)
                                ),
                                child: FlatButton(
                                  onPressed: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (_) => RegScreen()));
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
                            padding: isScreenWide ? const EdgeInsets.only(left: 70.0 , right: 15.0 , top: 18.0 , bottom: 0.0) : const EdgeInsets.only(left: 9.0 , right: 15.0 , top: 18.0 , bottom: 0.0) ,
                            child: Center(
                              child: Container(
                                height: 50,
                                width: 250,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple, borderRadius: BorderRadius.circular(20)
                                ),
                                child: FlatButton(
                                  onPressed: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPoliceScreen()));
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
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                child: Flex(
                  direction: isScreenWide ? Axis.horizontal : Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 0.0 , left:  0.0 , top: 0.0 , bottom: 0.0),
                      child: Container(
                        child: Column(
                          children: [
                            Icon(CupertinoIcons.home ,color: Colors.red,),
                            Text("Simplified Complaints" , style: GoogleFonts.roboto(color: Colors.blue , fontSize: 30 , fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 0.0 , left:  0.0 , top: 0.0 , bottom: 0.0),
                      child: Container(
                        child: Column(
                          children: [
                            Icon(CupertinoIcons.person_solid ,color: Colors.red,),
                            Text("No Queues and Delays" , style: GoogleFonts.roboto(color: Colors.blue , fontSize: 30 , fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 0.0 , left:  0.0 , top: 0.0 , bottom: 0.0),
                      child: Container(
                        child: Column(
                          children: [
                            Icon(CupertinoIcons.time_solid ,color: Colors.red,),
                            Text("Quick Response" , style: GoogleFonts.roboto(color: Colors.blue , fontSize: 30 , fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Container(
                  color: Colors.deepOrangeAccent,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.0 , bottom: 5.0),
                        child: Center(
                            child: Text("About us" , style: GoogleFonts.sora(color: Colors.black87 , fontSize: 30 , fontWeight: FontWeight.bold))
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0 , bottom: 5.0 , right: 40.0 , left: 40.0),
                        child: Center(
                            child: Text("To address the challenges faced by the citizens of India. we, student of National Institute of Technology , Uttarakhand had put together a team and build a system. We are probably living in the worst time our modern society has ever seen in terms of women security. We aim to make citizens feel strong enough to fight the odds strong enough to protect themselves against any assaults. We nim at giving power to those without whom we cease to exist. Our idea is to design a system which shall re-establish how very gregarious mankind is. We are focusing on building an effective, fast and reliant system to make the citizens feel safe and empowered. Our platform will ace as 24/7 actice help and companion for citizens so that they don't ever feel that they are alone in the middle of a crisis situation. As it is 24/7, any person can signup/login anytime anywhere and register complaint which will be seen by the police station and action will be taken as soon as complaint will be registered. After action taken by the police the person can see it on site that action is taken and the issue is solved." , style: GoogleFonts.roboto(color: Colors.black87, fontSize: 17))
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
    );
  }
}

