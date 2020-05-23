import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

TextEditingController _date = TextEditingController();
var now = DateTime.now();

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
  @override
  _FishState createState() => _FishState();
}

class _FishState extends State<Fish> {
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
      appBar: AppBar(title: Text('HEALTHCARE'),),
      body: SingleChildScrollView(
              child: Container(
          
          child: Column(
            children: <Widget>[
              Text(
                'Functional Independance score in hemophilia',
                style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.black),
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
                                  self.bathingValue = newValue;
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
              SizedBox(height: 20,),
              Container(
                child: Row(children: <Widget>[
                  Text('Total Score')
                ],)
              ),

            SizedBox(height: 15),
                    Container(
                      height: 30,
                      width: 100,
                      color: Colors.greenAccent,
                        
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),

                        ),
                        child: Text('SAVE',
                          style: TextStyle(
                            color: Colors.white,
                          )

                          
                        ),
                       
                        onPressed: null
                      ),

                    ),
                   

              
            ],
          ),
        ),
      ),
    );
          
  }
}
	
  