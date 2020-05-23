import 'package:flutter/material.dart';

import './be.dart';
import './fish.dart';


String patientName;
String factorD = 'viii';
String factorA = '<1';

// MediaQueryData queryData;

class PatientDashboard extends StatefulWidget {

  PatientDashboard(name) {
    patientName = name;
  }
  @override
  _PatientDashboardState createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  double _screenWidth(context) {
    // print(MediaQuery.of(context).size.width);
    
    return MediaQuery.of(context).size.width;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Dashboard'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // padding: EdgeInsets.all(15)
        padding: EdgeInsets.only(top: 15),
        child: Stack(children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
              child: Text(patientName,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: Container(
              height: 1,
              width: _screenWidth(context),
              color: Colors.greenAccent,
            ),
          ),

          Positioned(
            top: 70,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Factor Deficiency: ',
              style: TextStyle(
                fontSize: 20,
              ),
              ),
            ),
          ),

          Positioned(
            top: 70,
            left: 180,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(factorD,
              style: TextStyle(
                fontSize: 20,
              ),
              ),
            ),
          ),

          Positioned(
            top: 110,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Factor Assay: ',
              style: TextStyle(
                fontSize: 20,
              ),
              ),
            ),
          ),
          Positioned(
            top: 110,
            left: 180,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(factorA,
              style: TextStyle(
                fontSize: 20,
              ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            child: Container(
              height: 1,
              width: _screenWidth(context),
              color: Colors.greenAccent,
            ),
          ),

          Positioned(
            top: 170,
            child: Container(
              height: MediaQuery.of(context).size.height - 270,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: IconButton(
                      icon: Image.asset('assets/blood.png',),
                      iconSize: 60,
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Be())),
                    ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 47,
                    child: Text('BE'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: VerticalDivider(  
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),

                  Positioned(
                    left: 250,
                    child: IconButton(
                      icon: Image.asset('assets/medical.png',),
                      iconSize: 60,
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Fish())),

                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 270,
                    child: Text('FISH'),
                  ),

                  Positioned(
                    top: 100,
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: 300,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  /* TODO: List View for date*/
                                  Text('hi', style: TextStyle(
                                    fontSize: 50,
                                  ),),
                                  Text('hi', style: TextStyle(
                                    fontSize: 50,
                                  ),),
                                  Text('hi', style: TextStyle(
                                    fontSize: 50,
                                  ),),
                                  Text('hi', style: TextStyle(
                                    fontSize: 50,
                                  ),),
                                  Text('hi', style: TextStyle(
                                    fontSize: 50,
                                  ),),
                                  Text('hi', style: TextStyle(
                                    fontSize: 50,
                                  ),),
                                  Text('hi', style: TextStyle(
                                    fontSize: 50,
                                  ),),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: MediaQuery.of(context).size.width/2,
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: 300,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  /* TODO: List View for date*/
                                  Text('hi', style: TextStyle(
                                    fontSize: 50,
                                  ),),
                                  Text('hi', style: TextStyle(
                                    fontSize: 50,
                                  ),),
                                  Text('hi', style: TextStyle(
                                    fontSize: 50,
                                  ),),
                                  Text('hi', style: TextStyle(
                                    fontSize: 50,
                                  ),),
                                  Text('hi', style: TextStyle(
                                    fontSize: 50,
                                  ),),
                                  Text('hi', style: TextStyle(
                                    fontSize: 50,
                                  ),),
                                  Text('hi', style: TextStyle(
                                    fontSize: 50,
                                  ),),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              
            ),
          ),
        
        ],),
      ),
    );
  }
}