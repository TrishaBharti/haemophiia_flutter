import 'package:flutter/material.dart';

import './patient_dashboard.dart';

bool isPatientsPresent = true;

List<String> patientsName = ['Anil', 'Raj', 'Sachin', 'Rahul', 'Gaurav', 'Nikesh'];
// List<String> patientsName = [];
class ListPatient extends StatefulWidget {

  @override
  _ListPatientState createState() => _ListPatientState();
}

class _ListPatientState extends State<ListPatient> {

  Widget _buildPatientTile(index) {

    return GestureDetector(
          child: Container(
        child: Column(
          children: <Widget> [
            
            ListTile(
              title: Text(
                patientsName[index],
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
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PatientDashboard(patientsName[index]))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Patients'),
      ),
      body: SingleChildScrollView(
        child: isPatientsPresent ? 
          Container(
            height: 1000,
            child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: patientsName.length,
            itemBuilder: (context, index) {
              return _buildPatientTile(index);
            },
          ),
        ):Container(
          padding: EdgeInsets.all(55),
          child: Text(
            'No Patient Data Present!',
            style: TextStyle(
              fontSize: 25,
              color: Colors.grey,
            ),
          ),
        ),

      ),
      
    );
  }
}