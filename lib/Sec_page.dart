import 'dart:math';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SidesPage extends StatefulWidget {
  final int i;
  SidesPage({this.i});
  @override
  _SidesPageState createState() => _SidesPageState();
}

class _SidesPageState extends State<SidesPage> with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _animationController1;
  Animation _animation;
  Animation _animation1;

  bool show = false;
  bool show1 = false;

  bool h1;
  bool h2;
  @override
  void initState() {
    h1 = h2 = false;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _animation1 = Tween(begin: 0.0, end: 1.0).animate(_animationController1);
    super.initState();

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController1.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        height: height * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "Next",
              style: GoogleFonts.raleway(
                  fontSize: 23, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back",
                style: GoogleFonts.raleway(
                    fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xfffaccc0), Color(0xfffbd6a2)],
                begin: Alignment.topLeft,
                end: Alignment.topRight)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Container(
                child: Center(
                  child: Text(
                    "Select the side(s) you \n prefer with dinner",
                    style: GoogleFonts.raleway(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Align(
                    alignment: Alignment(0, -0.9),
                    child: Container(
                        child: Hero(
                      tag: 'tagImage' + widget.i.toString(),
                      child: Image.asset(
                        loc[widget.i],
                        height: 300,
                        width: 300,
                      ),
                    )),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(-2, -2),
                              blurRadius: 20.0,
                            )
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      height: 250,
                      width: width,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text("Sides",
                              style: GoogleFonts.raleway(
                                  fontSize: 26, fontWeight: FontWeight.w600)),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Transform.translate(
                                            offset: Offset.fromDirection(
                                                1.42 * pi,
                                                _animation.value * 200),
                                            child: Image.asset(
                                                'assets/Salad.png')),
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                show = !show;
                                                h1 = !h1;
                                              });
                                              if (_animationController
                                                  .isCompleted) {
                                                _animationController.reverse();
                                              } else {
                                                _animationController.forward();
                                              }
                                            },
                                            child: Container(
                                                decoration: h1
                                                    ? BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90),
                                                        boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .orange,
                                                                blurRadius: 20)
                                                          ])
                                                    : null,
                                                child: Image.asset(
                                                    'assets/Salad.png'))),
                                      ],
                                    ),
                                    Text(
                                      'Any Salad',
                                      style: GoogleFonts.raleway(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Transform.translate(
                                            offset: Offset.fromDirection(
                                                1.58 * pi,
                                                _animation1.value * 200),
                                            child: Image.asset(
                                              'assets/Soup.png',
                                            )),
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                show1 = !show1;
                                                h2 = !h2;
                                              });
                                              if (_animationController1
                                                  .isCompleted) {
                                                _animationController1.reverse();
                                              } else {
                                                _animationController1.forward();
                                              }
                                            },
                                            child: Container(
                                                decoration: h2
                                                    ? BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90),
                                                        boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .orange,
                                                                // : Colors.white,
                                                                blurRadius: 20)
                                                          ])
                                                    : null,
                                                child: Image.asset(
                                                    'assets/Soup.png'))),
                                      ],
                                    ),
                                    Text(
                                      'Any Soup',
                                      style: GoogleFonts.raleway(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
