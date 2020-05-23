import 'package:flutter/material.dart';
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('HEALTHCARE'),),
          body: Container(
        child: Column(
          children: <Widget>[
            Text(
              'ABOUT US',
              style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.green),
            ),
            SizedBox(height: 10),
            Image.asset('assets/hem1.png'),
            SizedBox(height: 35),
            Text('Hemophilia is a rare disorder in which your blood does not clot normally because it lacks sufficient factors.This can lead to spontaneous bleeding as well as bleeding following injuries.People with hemophilia have low levels of either factor VIII (8) or factor IX (9).This app helps to capture the details of the patients who are suffering from hemophilia.the patiets who are using this app have to submit their details like name,blood group,factor assay,factor deficiency.Next Pages are the bleeding episode page functional independance score page in which they have to enter the details regarding trauma, left knee and right knee.This app will help the doctors during treatments.',
            style: TextStyle(fontSize: 14.0,color: Colors.black),)
          ],
        )

        
      ),
    );
  }
}