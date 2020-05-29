import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

var data;

class LeftKnee {
  String lEvaluationDate;
  String lKneeMajor;
  String lKneeMinor;
  String lKneeSpontaneous;
  String lKneeTrauma;
  String lKneeTScore;

  LeftKnee(this.lEvaluationDate, this.lKneeSpontaneous, this.lKneeMajor, this.lKneeMinor, this.lKneeTrauma, this.lKneeTScore);
}

class RightKnee {
  String rEvaluationDate;
  String rKneeMajor;
  String rKneeMinor;
  String rKneeSpontaneous;
  String rKneeTrauma;
  String rKneeTScore;

  RightKnee(this.rEvaluationDate, this.rKneeSpontaneous, this.rKneeMajor, this.rKneeMinor, this.rKneeTrauma, this.rKneeTScore);

}

var lKnee = LeftKnee("0", "0", "0", "0", "0", "0");
var rKnee = RightKnee("0", "0", "0", "0", "0", "0");



class ViewBeDetails extends StatefulWidget {

  ViewBeDetails(beData) {
    if(beData!=null) {
      data = beData;
      final lkneeobj = LeftKnee(data['evaluation_date'],data['lknee_spontaneous'].toString() , data['lknee_major'].toString(), data['lknee_minor'].toString(), data['lknee_trauma'].toString(), data['tlknee_value'].toString());
      lKnee = lkneeobj;


      final rkneeobj = RightKnee(data['evaluation_date'],data['rknee_spontaneous'].toString() , data['rknee_major'].toString(), data['rknee_minor'].toString(), data['rknee_trauma'].toString(), data['trknee_value'].toString());
      rKnee = rkneeobj;
      print(rKnee.rEvaluationDate);
      print(rKnee.rKneeSpontaneous);
      print(rKnee.rKneeMajor);
      print(rKnee.rKneeMinor);
      print(rKnee.rKneeTrauma);
      print(rKnee.rKneeTScore);

    }
  }

  @override
  _ViewBeDetailsState createState() => _ViewBeDetailsState();
}

class _ViewBeDetailsState extends State<ViewBeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Be Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
        height: MediaQuery.of(context).size.height - 50,  
        child: Column(
          children: <Widget>[
            Container(
              height: 20,
            ),
            SingleChildScrollView(
                child: Container(
                height: (MediaQuery.of(context).size.height - 200)/2,
                width: MediaQuery.of(context).size.width-30,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.greenAccent
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: (MediaQuery.of(context).size.width - 150)/2,
                      child: Text('Left Knee',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 20,
                      child: Container(
                        height: 70,
                        width: 120,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                child: Container(
                                height: 50,
                                child: VerticalDivider(
                                  color: Colors.red,
                                  thickness: 3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                child: Text('Trauma',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 40,
                              top: 20,
                              child: Container(
                                child: Text(lKnee.lKneeTrauma,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            )),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 140,
                      left: 20,
                      child: Container(
                        height: 70,
                        width: 120,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                child: Container(
                                height: 50,
                                child: VerticalDivider(
                                  color: Colors.blue,
                                  thickness: 3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                child: Text('Spontaneous',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 40,
                              top: 20,
                              child: Container(
                                child: Text(lKnee.lKneeSpontaneous,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            )),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 50,
                      left: 140,
                      child: Container(
                        height: 70,
                        width: 100,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                child: Container(
                                height: 50,
                                child: VerticalDivider(
                                  color: Colors.yellow,
                                  thickness: 3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                child: Text('Major',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 40,
                              top: 20,
                              child: Container(
                                child: Text(lKnee.lKneeMajor,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            )),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 140,
                      left: 140,
                      child: Container(
                        height: 70,
                        width: 100,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                child: Container(
                                height: 50,
                                child: VerticalDivider(
                                  color: Colors.green,
                                  thickness: 3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                child: Text('Minor',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 40,
                              top: 20,
                              child: Container(
                                child: Text(lKnee.lKneeMinor,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            )),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 50,
                      left: 210,
                      child: Container(
                        height: 140,
                        width: 140,
                        child: CircularPercentIndicator(
                          radius: 120.0,
                          lineWidth: 5.0,
                          progressColor: Colors.greenAccent,
                          percent: (int.parse(lKnee.lKneeTScore)/28).toDouble(),
                          center: Text("Total Score\n        " + lKnee.lKneeTScore,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ), 
                    
                    ),
                    
                  ],
                  
                ),
              ),
            ),
            Container(
              height: 20,
            ),
            Container(
              height: (MediaQuery.of(context).size.height - 200)/2,
              width: MediaQuery.of(context).size.width-30,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.greenAccent
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  
                ),
              ),
              child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: (MediaQuery.of(context).size.width - 150)/2,
                      child: Text('Right Knee',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 20,
                      child: Container(
                        height: 70,
                        width: 120,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                child: Container(
                                height: 50,
                                child: VerticalDivider(
                                  color: Colors.red,
                                  thickness: 3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                child: Text('Trauma',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 40,
                              top: 20,
                              child: Container(
                                child: Text(rKnee.rKneeTrauma,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            )),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 140,
                      left: 20,
                      child: Container(
                        height: 70,
                        width: 120,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                child: Container(
                                height: 50,
                                child: VerticalDivider(
                                  color: Colors.blue,
                                  thickness: 3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                child: Text('Spontaneous',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 40,
                              top: 20,
                              child: Container(
                                child: Text(rKnee.rKneeSpontaneous,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            )),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 50,
                      left: 140,
                      child: Container(
                        height: 70,
                        width: 100,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                child: Container(
                                height: 50,
                                child: VerticalDivider(
                                  color: Colors.yellow,
                                  thickness: 3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                child: Text('Major',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 40,
                              top: 20,
                              child: Container(
                                child: Text(rKnee.rKneeMajor,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            )),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 140,
                      left: 140,
                      child: Container(
                        height: 70,
                        width: 100,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                child: Container(
                                height: 50,
                                child: VerticalDivider(
                                  color: Colors.green,
                                  thickness: 3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                child: Text('Minor',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 40,
                              top: 20,
                              child: Container(
                                child: Text(rKnee.rKneeMinor,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            )),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 50,
                      left: 210,
                      child: Container(
                        height: 140,
                        width: 140,
                        child: CircularPercentIndicator(
                          radius: 120.0,
                          lineWidth: 5.0,
                          progressColor: Colors.greenAccent,
                          percent: (int.parse(rKnee.rKneeTScore)/28).toDouble(),
                          center: Text("Total Score\n        " + rKnee.rKneeTScore,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ), 
                    
                    ),
                    
                  ],
                  
                ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}