import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import './be.dart';
import './fish.dart';
import '../services/flask_services.dart';
import '../pages/view_be_details.dart';
import '../pages/view_fish_details.dart';


String patientName;
String patientId;
String factorD;
String factorA;

bool isLoading;

bool isBeDetails;
bool isFishDetails;

List beEvaluationDate;
List fishEvaluationDate;

// MediaQueryData queryData;

class PatientDashboard extends StatefulWidget {

  PatientDashboard(map) {
    beEvaluationDate = [];
    isBeDetails = false;
    isFishDetails = false;
    isLoading = true;
    patientName = map['name'];
    patientId = map['id'].toString();
  }
  @override
  _PatientDashboardState createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {

  _PatientDashboardState() {
    FlaskServices.getPatientDetails(patientId).then((value) {
      addFactorDandADetails(value[0]['factor_deficiency'], value[0]['factor_assay'].toString());
    });

    FlaskServices.getPatientBeDetails(patientId).then((value) {
      _addBeDateDetails(value);
    });

    FlaskServices.getPatientFishDetails(patientId).then((value) {
      _addFishDateDetails(value);
    });
    
  }

  Widget _buildPatientTileBe(index) {
    return GestureDetector(
          child: Container(
            child: Column(
              children: <Widget> [
            
            ListTile(
              title: Text(
                beEvaluationDate[index]['evaluation_date'],
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
          
            Divider(
              color: Colors.green,
            ),
          ],
          
        )
        
      ),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ViewBeDetails(beEvaluationDate[index]))),
    );
  }

  Widget _buildPatientTileFish(index) {
    return GestureDetector(
          child: Container(
            child: Column(
              children: <Widget> [
            
            ListTile(
              title: Text(
                fishEvaluationDate[index]['evaluation_date'],
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
          
            Divider(
              color: Colors.green,
            ),
          ],
          
        )
        
      ),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ViewFishDetails(fishEvaluationDate[index]))),
    );
  }


  void _addBeDateDetails(value) {
    if(value!=null) {
      setState(() {
        beEvaluationDate = value;
        isBeDetails = true;  
      });
    }

  }

  void _addFishDateDetails(value) {
    if(value!=null) {
      setState(() {
        fishEvaluationDate = value;
        isFishDetails = true;
      });
    }
  }

  void addFactorDandADetails(fd, fa) {
    setState(() {
      factorD = fd;
      factorA = fa;

      isLoading = false;
    });
  }

  double _screenWidth(context) {
    
    return MediaQuery.of(context).size.width;
  }
  @override
  Widget build(BuildContext context) {
    return isLoading? Scaffold(
      body: Center(
        child: SpinKitDualRing(
          color: Colors.greenAccent,
          size: 80,
        ), 
      ),
    ):Scaffold(
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
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Be(patientId))),
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
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Fish(patientId))),

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
                              child: isBeDetails ? Container(
                                height: 300,
                                child: ListView.builder(
                                padding: EdgeInsets.all(10),
                                itemCount: beEvaluationDate.length,
                                itemBuilder: (context, index) {
                                  return _buildPatientTileBe(index);
                                },
                              ),
                                
                              ): Container(
                                padding: EdgeInsets.all(55),
                                child: Text(
                                  'No Be Data Present!',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.grey,
                                  ),
                                ),
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
                              child: isFishDetails ? Container(
                                height: 300,
                                child: ListView.builder(
                                padding: EdgeInsets.all(10),
                                itemCount: fishEvaluationDate.length,
                                itemBuilder: (context, index) {
                                  return _buildPatientTileFish(index);
                                },
                              ),
                                
                              ): Container(
                                padding: EdgeInsets.all(55),
                                child: Text(
                                  'No Fish Data Present!',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.grey,
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
              
            ),
          ),
        
        ],),
      ),
    );
  }
}