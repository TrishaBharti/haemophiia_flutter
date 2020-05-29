import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import './patient_dashboard.dart';
import '../services/flask_services.dart';

bool isPatientsPresent;
bool isLoading = true;

List<dynamic> patName;
class ListPatient extends StatefulWidget {

  ListPatient() {
    isLoading = true;
    isPatientsPresent = false;
  }

  @override
  _ListPatientState createState() => _ListPatientState();
}

class _ListPatientState extends State<ListPatient> {

  _ListPatientState() {

    FlaskServices.getPatients().then((value) {
      patName = value;
      _isPatientPopulated();
      
    });
  }

  void _isPatientPopulated() {
    setState(() {
      if(patName.length > 0){
        isPatientsPresent = true;
      }
      isLoading = false;
    });
  }


  Widget _buildPatientTile(index) {
    return GestureDetector(
          child: Container(
            child: Column(
              children: <Widget> [
            
            ListTile(
              title: Text(
                patName[index]['name'],
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
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PatientDashboard(patName[index]))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? Scaffold(
      body: Center(
        child: SpinKitDualRing(
          color: Colors.greenAccent,
          size: 80,
        ), 
      ),
    ):
    Scaffold(
      appBar: AppBar(
        title: Text('List of Patients'),
      ),
      body: SingleChildScrollView(
        child: isPatientsPresent ? 
        Container(
          height: MediaQuery.of(context).size.height - 100,
  
            child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: patName.length,
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