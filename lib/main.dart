import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss/Sec_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

List<String> loc = [
  'assets/Curry_Rice.png',
  'assets/Curry_Roti_Rice.png',
  'assets/Dal_Rice.png',
  'assets/Dal_Roti.png',
  'assets/Sabji_Dal_Rice.png',
  'assets/Sabji_Dal_Roti_Rice.png',
  'assets/Sabji_Dal_Roti.png',
  'assets/Sabji_Roti.png'
];

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(loc.length);
    return SafeArea(
      child: Scaffold(
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
            Text(
              "Back",
              style: GoogleFonts.raleway(
                  fontSize: 23, fontWeight: FontWeight.bold),
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
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "How does your Dinner \n look like?",
                          style: GoogleFonts.raleway(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "(excluding salad, curd and sides)",
                          style: GoogleFonts.raleway(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Select any 1 or more plates",
                          style: GoogleFonts.raleway(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    )),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: loc.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2),
                      itemBuilder: (ctx, i) => GestureDetector(
                            onTap: () {
                              // await new Future.delayed(
                              //     const Duration(milliseconds: 4000));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SidesPage(
                                            i: i,
                                          )));
                            },
                            child: Container(
                              child: Hero(
                                  tag: "tagImage$i",
                                  child: Image.asset(loc[i])),
                            ),
                          )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
