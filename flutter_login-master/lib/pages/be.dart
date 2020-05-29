import 'package:flutter/material.dart';
import 'package:flutter_login/pages/patient_dashboard.dart';
import 'package:flutter_login/services/flask_services.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

TextEditingController _date = TextEditingController();
var now = DateTime.now();
String traumaValue = "0";
String spontaneousValue = "0";
String minorValue = "0";
String majorValue = "0";

double rating = 0.0;

class RightKnee{
String rtraumaValue;
String rspontaneousValue;
String rminorValue;
String rmajorValue ;
String patientId;

RightKnee(this.rtraumaValue,this.rspontaneousValue,this.rmajorValue,this.rminorValue);


}
 var rKnee = RightKnee("0","0","0","0");

class Be extends StatefulWidget {

  Be(id) {
    patientId = id;
  }
  @override
  _BeState createState() => _BeState();
}

class _BeState extends State<Be> {

  void _confirmCall(context) {

    var requestBody = {
      "lknee_trauma":traumaValue,
      "lknee_spontaneous":spontaneousValue,
      "lknee_minor":minorValue,
      "lknee_major":majorValue,	
      "rknee_trauma":rKnee.rtraumaValue,
      "rknee_spontaneous":rKnee.rspontaneousValue,
      "rknee_minor":rKnee.rminorValue,
      "rknee_major":rKnee.rmajorValue,
      "p_id":patientId,
      "evaluation_date":_date.text
    };
    FlaskServices.addbeDetails(requestBody).then((value) {
      if(value == 200) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Data Added!",
          buttons: [
            DialogButton(
          child: Text("OK"), onPressed: () => Navigator.pop(context),
          width: 120,
        ),
          ],
        ).show();
      }
    });

  }

    Future _selectDate(context) async {
    var formatter = DateFormat('yyyy-MM-dd');
    DateTime picked = await showDatePicker(
        context: context,
        firstDate: now,
        initialDate: now,
        lastDate: now.add(Duration(days: 30)));
    
    if (picked != null) {
          String sDate = formatter.format(picked);
          _date.value = TextEditingValue(text: sDate.toString());
    }
  }

 
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text('Bleeding Episodes'),),
      body: SingleChildScrollView(
              child: Container(
          
          child: Column(
            children: <Widget>[
              Text(
                'Score ranges from 1-4\n\n1. Unable to perform the activity\n2. Needs Partial aid to perform the activity\n3. Perform activity without aid with slight discomfort\n4. Able to perfrom activity',
                style: TextStyle(
                  fontSize: 17.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.black
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 25),
                    child: Text('Evaluation Date* : ',
                      style: TextStyle(fontSize: 16),
                    
                    
                     ),
                  ),
                  
                  Container(
                    padding: EdgeInsets.only(left: 60),
                    width: 200,
                    child: TextFormField(
                      controller: _date,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        // labelText: 'Date',
                        //prefixText: _value,
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                      onTap: ()=>_selectDate(context),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: 390,
                
                child: Card(
                
                  child: Text('Left Knee',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,color: Colors.white,
                    ) ,
                  ),
                  color: Colors.green,
                )
              ),
                 SizedBox(height: 10),

              Container(
                padding: EdgeInsets.only(left: 25),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Trauma ',
                         style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(left: 130)),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                              )
                            ),
                          ),
                          width: 140,
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                            focusColor: Colors.blue,
                            alignedDropdown: true,
                            child: DropdownButton(
                              value: traumaValue,
                              
                              items: <String>["0","1","2","3","4"].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  
                                  value: value,
                                  child: Text(value),
                                );
                                }).toList(),
                                isDense: true,
                                onChanged: (String newValue) {
                                setState(() {
                                  traumaValue = newValue;
                                });
                            }
                            ),
                          ),
                          ),
                        )
                        

                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Text('Spontaneous',
                         style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(left: 95)),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                              )
                            ),
                          ),
                          width: 140,
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                            focusColor: Colors.blue,
                            alignedDropdown: true,
                            child: DropdownButton(
                              value: spontaneousValue,
                              
                              items: <String>["0","1","2","3","4"].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  
                                  value: value,
                                  child: Text(value),
                                );
                                }).toList(),
                                isDense: true,
                                onChanged: (String newValue) {
                                setState(() {
                                  spontaneousValue = newValue;
                                });
                            }
                            ),
                          ),
                          ),
                        ),
                        

                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Text('Minor',
                         style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(left: 145)),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                              )
                            ),
                          ),
                          width: 140,
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                            focusColor: Colors.blue,
                            alignedDropdown: true,
                            child: DropdownButton(
                              value: minorValue,
                              
                              items: <String>["0","1","2","3","4"].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  
                                  value: value,
                                  child: Text(value),
                                );
                                }).toList(),
                                isDense: true,
                                onChanged: (String newValue) {
                                setState(() {
                                  minorValue = newValue;
                                });
                            }
                            ),
                          ),
                          ),
                        ),
                        

                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Text('Major',
                         style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(left: 145)),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                              )
                            ),
                          ),
                          width: 140,
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                            focusColor: Colors.blue,
                            alignedDropdown: true,
                            child: DropdownButton(
                              value: majorValue,
                              
                              items: <String>["0","1","2","3","4"].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  
                                  value: value,
                                  child: Text(value),
                                );
                                }).toList(),
                                isDense: true,
                                onChanged: (String newValue) {
                                setState(() {
                                  majorValue = newValue;
                                });
                            }
                            ),
                          ),
                          ),
                        ),
                        

                      ],
                    ),
                  
                  ],
                ),
              ),
              SizedBox(height: 15),
Container(
                width: 390,
                
                child: Card(
                
                  child: Text('Right Knee',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,color: Colors.white,
                    ) ,
                  ),
                  color: Colors.green,
                )
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 25),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Trauma ',
                         style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(left: 130)),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                              )
                            ),
                          ),
                          width: 140,
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                            focusColor: Colors.blue,
                            alignedDropdown: true,
                            child: DropdownButton(
                              value: rKnee.rtraumaValue,
                              
                              items: <String>["0","1","2","3","4"].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  
                                  value: value,
                                  child: Text(value),
                                );
                                }).toList(),
                                isDense: true,
                                onChanged: (String newValue) {
                                setState(() {
                                  rKnee.rtraumaValue = newValue;
                                });
                            }
                            ),
                          ),
                          ),
                        )

                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Text('Spontaneous',
                         style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(left: 95)),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                              )
                            ),
                          ),
                          width: 140,
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                            focusColor: Colors.blue,
                            alignedDropdown: true,
                            child: DropdownButton(
                              value: rKnee.rspontaneousValue,
                              
                              items: <String>["0","1","2","3","4"].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  
                                  value: value,
                                  child: Text(value),
                                );
                                }).toList(),
                                isDense: true,
                                onChanged: (String newValue) {
                                setState(() {
                                  rKnee.rspontaneousValue = newValue;
                                });
                            }
                            ),
                          ),
                          ),
                        ),
                        

                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Text('Minor',
                         style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(left: 145)),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                              )
                            ),
                          ),
                          width: 140,
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                            focusColor: Colors.blue,
                            alignedDropdown: true,
                            child: DropdownButton(
                              value: rKnee.rminorValue,
                              
                              items: <String>["0","1","2","3","4"].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  
                                  value: value,
                                  child: Text(value),
                                );
                                }).toList(),
                                isDense: true,
                                onChanged: (String newValue) {
                                setState(() {
                                  rKnee.rminorValue = newValue;
                                });
                            }
                            ),
                          ),
                          ),
                        ),
                        

                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Text('Major',
                         style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(left: 145)),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                              )
                            ),
                          ),
                          width: 140,
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                            focusColor: Colors.blue,
                            alignedDropdown: true,
                            child: DropdownButton(
                              value: rKnee.rmajorValue,
                              
                              items: <String>["0","1","2","3","4"].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  
                                  value: value,
                                  child: Text(value),
                                );
                                }).toList(),
                                isDense: true,
                                onChanged: (String newValue) {
                                setState(() {
                                  rKnee.rmajorValue = newValue;
                                });
                            }
                            ),
                          ),
                          ),
                        ),
                        

                      ],
                    ),
                    SizedBox(height: 40),
                    Container(
                      height: 30,
                      width: 100,
                      color: Colors.black,
                        
                      child: RaisedButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),

                        ),
                        child: Text('SAVE',
                          style: TextStyle(
                            color: Colors.white,
                          )                          
                        ),
                       
                        onPressed: () =>_confirmCall(context),
                      ),

                    ),
                   
                    SizedBox(
                      height: 10,
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
	
  