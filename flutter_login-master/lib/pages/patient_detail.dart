import 'package:flutter/material.dart';

import '../services/flask_services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class  PatientDetails extends StatelessWidget {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController factorDController = TextEditingController();
  final TextEditingController factorAController = TextEditingController();

  void _showAlertDialog(context) {
    print('Alert');
    Alert(
      context: context,
      type: AlertType.success,
      title: "Patient Data Successfully Stored!",
      buttons: [
        DialogButton(
          child: Text("OK"), onPressed: () => Navigator.pop(context),
          width: 120,
        ),
      ]
    ).show();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HEALTHCARE'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(40),
                    child: Text(
                      'Patients Details ',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(2),
                    child: Text(
                      'Patients Enrollments',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Patient Name',
                    ),

                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone number',
                    ),
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: bloodGroupController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Blood group',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: factorDController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Factor Deficiency',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: factorAController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Factor Assay',
                    ),
                  ),
                ),

                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text('Save',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        print(nameController.text);
                        print(phoneController.text);
                        print(bloodGroupController.text);
                        print(factorDController.text);
                        print(factorAController.text);
                        FlaskServices.addPatient(
                          nameController.text,
                          phoneController.text,
                          bloodGroupController.text,
                          factorDController.text,
                          factorAController.text
                        );
                        _showAlertDialog(context);
                        
                      },
                    )),

              ],
            )));
  }


}