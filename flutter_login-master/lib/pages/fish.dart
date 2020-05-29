import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/flask_services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

TextEditingController _date = TextEditingController();
var now = DateTime.now();

String patientId;

class SelfCare{
String groomingValue;
String bathingValue;
String dressingValue;

SelfCare(this.groomingValue,this.bathingValue,this.dressingValue);

}
var self = SelfCare("0","0","0");

class Transfer{
String chairValue;
String squattingValue;
Transfer(this.chairValue,this.squattingValue);


}
 var trans = Transfer("0","0");

 class Locomotion{
String walkingValue;
String runningValue;
String stairValue;

Locomotion(this.walkingValue,this.runningValue,this.stairValue);


}
 var loco = Locomotion("0","0","0");

 

class Fish extends StatefulWidget {

  Fish(id) {
    patientId = id;

  }

  @override
  _FishState createState() => _FishState();
}

class _FishState extends State<Fish> {

  void _confirmCall(context) {
    print(patientId);
    var requestBody = {

      "grooming":self.groomingValue,
      "bathing":self.bathingValue,
      "dressing":self.dressingValue,
      "chair":trans.chairValue,
      "squatting":trans.squattingValue,
      "walking":loco.walkingValue,
      "running":loco.runningValue,
      "stairs":loco.stairValue,
      "evaluation_date":_date.text,
      "p_id":patientId
    };

    FlaskServices.addFishDetails(requestBody).then((value) {
      if(value == 200) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Data Added!",
          buttons: [
            DialogButton(
          child: Text("OK"), onPressed: () {
            Navigator.pop(context);
            
          },
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
      appBar: AppBar(title: Text('Functional Independance Score'),),
      body: SingleChildScrollView(
              child: Container(
          
          child: Column(
            children: <Widget>[
              Text(
                'Score ranges from 1-4, depending on\ndegree of independence\n\n1. Unable to perform the activity\n2. Needs Partial aid to perform the activity\n3. Perform activity without aid with slight discomfort\n4. Able to perfrom activity',
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
                
                  child: Text('Self Care',
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
                        Text('Grooming ',
                         style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(left: 100)),
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
                              value: self.groomingValue,
                              
                              items: <String>["0","1","2","3","4"].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  
                                  value: value,
                                  child: Text(value),
                                );
                                }).toList(),
                                isDense: true,
                                onChanged: (String newValue) {
                                setState(() {
                                  self.groomingValue = newValue;
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
                        Text('Bathing',
                         style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(left: 120)),
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
                              value: self.bathingValue,
                              
                              items: <String>["0","1","2","3","4"].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  
                                  value: value,
                                  child: Text(value),
                                );
                                }).toList(),
                                isDense: true,
                                onChanged: (String newValue) {
                                setState(() {
                                  self.bathingValue = newValue;
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
                        Text('Dressing',
                         style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(left: 110)),
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
                              value: self.dressingValue,
                              
                              items: <String>["0","1","2","3","4"].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  
                                  value: value,
                                  child: Text(value),
                                );
                                }).toList(),
                                isDense: true,
                                onChanged: (String newValue) {
                                setState(() {
                                  self.dressingValue = newValue;
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
                
                  child: Text('Transfers',
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
                        Text('Chair ',
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
                              value: trans.chairValue,
                              
                              items: <String>["0","1","2","3","4"].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  
                                  value: value,
                                  child: Text(value),
                                );
                                }).toList(),
                                isDense: true,
                                onChanged: (String newValue) {
                                setState(() {
                                  trans.chairValue = newValue;
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
                        Text('Squatting',
                         style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(left: 100)),
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
                              value: trans.squattingValue,
                              
                              items: <String>["0","1","2","3","4"].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  
                                  value: value,
                                  child: Text(value),
                                );
                                }).toList(),
                                isDense: true,
                                onChanged: (String newValue) {
                                setState(() {
                                  trans.squattingValue = newValue;
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
                
                  child: Text('Locomotion',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,color: Colors.white,
                    ) ,
                  ),
                  color: Colors.green,
                )
              ),
                SizedBox(height: 15),
                Container(
                padding: EdgeInsets.only(left: 25),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Walking ',
                         style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(left: 110)),
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
                              value: loco.walkingValue,
                              
                              items: <String>["0","1","2","3","4"].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  
                                  value: value,
                                  child: Text(value),
                                );
                                }).toList(),
                                isDense: true,
                                onChanged: (String newValue) {
                                setState(() {
                                  loco.walkingValue = newValue;
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
                        Text('Running',
                         style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(left: 110)),
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
                              value: loco.runningValue,
                              
                              items: <String>["0","1","2","3","4"].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  
                                  value: value,
                                  child: Text(value),
                                );
                                }).toList(),
                                isDense: true,
                                onChanged: (String newValue) {
                                setState(() {
                                  loco.runningValue = newValue;
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
                        Text('Stairs',
                         style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(left: 127)),
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
                              value: loco.stairValue,
                              
                              items: <String>["0","1","2","3","4"].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  
                                  value: value,
                                  child: Text(value),
                                );
                                }).toList(),
                                isDense: true,
                                onChanged: (String newValue) {
                                setState(() {
                                  loco.stairValue = newValue;
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
              // SizedBox(height: 20,),
              // Container(
              //   child: Row(children: <Widget>[
              //     Text('Total Score')
              //   ],)
              // ),

            SizedBox(height: 15),
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
                       
                        onPressed: () => _confirmCall(context),
                      ),

                    ),
                    SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
          
  }
}
	
  