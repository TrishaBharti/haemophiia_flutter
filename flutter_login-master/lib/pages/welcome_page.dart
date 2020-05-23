import 'package:flutter/material.dart';

import './patient_detail.dart';
import './about.dart';
// import './fish.dart';
// import './be.dart';
import './list_patient.dart';


class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
        child: Stack(children: <Widget>[
          
          

          Positioned(
            
              left: 70,
              top:100,
              
              child: Text(
              'WELCOME',
              style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold,color: Colors.green),
            ),
            
          ),
          Positioned(
            top: 250,
            left: 200,
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Image.asset('assets/file.png'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PatientDetails()));
                  },
                  iconSize: 70,
                ),
                Text(
                  'ENROLL',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            )
          ),

          Positioned(
            top: 250,
            left: 80,
            child: Column(
              children: <Widget>[
                IconButton(
                  iconSize: 70,
                  icon: Image.asset('assets/aboutus.png', ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
                  },
                ),

                Text(
                  'ABOUT US',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ),
         
          // Positioned(
          //   top: 400,
          //   left: 80,
          //   child: Column(
          //     children: <Widget>[
          //       IconButton(
          //         iconSize: 70,
          //         icon: Image.asset('assets/blood.png', ),
          //        onPressed: (){
          //           Navigator.push(context, MaterialPageRoute(builder: (context) => Be()));
          //        },
          //       ),
          //       Text(
          //         'BE',
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //         ),
          //       )
          //     ],
          //   )
          // ),
          // Positioned(
          //   top: 400,
          //   left: 200,
          //   child: Column(
          //     children: <Widget>[
          //       IconButton(
          //         iconSize: 70,
          //         icon: Image.asset('assets/medical.png', ),
          //         onPressed: (){
          //           Navigator.push(context, MaterialPageRoute(builder: (context) => Fish()));
          //         },
          //       ),
          //       Text(
          //         'FISH',
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ],
          //   )
          // )

          Positioned(
            top: 400,
            left: 150,
            child: Column(
              children: <Widget>[
                IconButton(
                  iconSize: 70,
                  icon: Image.asset('assets/list_patient.png',),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListPatient()));
                  },
                ),
                Text(
                  'List Patients',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ),  
        ],
      )       
    );
  }
}