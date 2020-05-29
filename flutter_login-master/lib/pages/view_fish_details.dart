import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

class FishDetails {
  String bathing;
  String chair;
  String dressing;
  String grooming;
  String running;
  String squatting;
  String stairs;
  String walking;
  String totalScore;

  FishDetails(this.bathing, this.chair, this.dressing, this.grooming, this.running, this.squatting, this.stairs, this.walking, this.totalScore);
}

var fish = FishDetails("0", "0", "0", "0", "0", "0", "0", "0", "0");

class ViewFishDetails extends StatefulWidget {

  ViewFishDetails(data) {
    
    final fishobj = FishDetails(data['bathing'].toString(), data['chair'].toString(), data['dressing'].toString(), data['grooming'].toString(), data['running'].toString(), data['squatting'].toString(), data['stairs'].toString(), data['walking'].toString(), data['total_score'].toString());
    fish = fishobj;
  }

  @override
  _ViewFishDetailsState createState() => _ViewFishDetailsState();
}

class _ViewFishDetailsState extends State<ViewFishDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fish Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: Stack(
            children: <Widget>[
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
                                child: Text('Grooming',
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
                                child: Text(fish.grooming,
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
                      top: 120,
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
                                  color: Colors.cyan,
                                  thickness: 3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                child: Text('Bathing',
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
                                child: Text(fish.bathing,
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
                      top: 190,
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
                                  color: Colors.yellow,
                                  thickness: 3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                child: Text('Dressing',
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
                                child: Text(fish.dressing,
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
                      top: 260,
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
                                child: Text('Chair',
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
                                child: Text(fish.chair,
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
                      left: 230,
                      child: Container(
                        height: 70,
                        width: 120,
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
                                child: Text('Squatting',
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
                                child: Text(fish.squatting,
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
                      top: 120,
                      left: 230,
                      child: Container(
                        height: 70,
                        width: 120,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                child: Container(
                                height: 50,
                                child: VerticalDivider(
                                  color: Colors.purple,
                                  thickness: 3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                child: Text('Walking',
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
                                child: Text(fish.walking,
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
                      top: 190,
                      left: 230,
                      child: Container(
                        height: 70,
                        width: 120,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                child: Container(
                                height: 50,
                                child: VerticalDivider(
                                  color: Colors.pink,
                                  thickness: 3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                child: Text('Running',
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
                                child: Text(fish.running,
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
                      top: 260,
                      left: 230,
                      child: Container(
                        height: 70,
                        width: 120,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                child: Container(
                                height: 50,
                                child: VerticalDivider(
                                  color: Colors.brown,
                                  thickness: 3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                child: Text('Stairs',
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
                                child: Text(fish.stairs,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 330,
                      left: (MediaQuery.of(context).size.width-170)/2, 
                      child: CircularPercentIndicator(
                        radius: 180.0,
                        lineWidth: 5.0,
                        progressColor: Colors.greenAccent,
                        percent: (int.parse(fish.totalScore)/32).toDouble(),
                        center: Text("Total Score\n        " + fish.totalScore,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    
                    
                            ),
            ],
          ),
        ),
      ),
    );
  }
}