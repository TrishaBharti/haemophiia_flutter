import 'package:requests/requests.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class FlaskServices{

  static void addPatient(name, phoneNumber, bloodGroup, factorD, factorA) async{


    var requestBody = {
      "name":name,
      "mobile_number":phoneNumber,
      "blood_group":bloodGroup,
      "factor_deficiency":factorD,
      "factor_assay":factorA
    };

    var response = await Requests.post("http://192.168.43.208:8000/v1/add-patient",
      bodyEncoding: RequestBodyEncoding.JSON,
      body: requestBody
    );
    

  }  

  static Future getPatients() async {
    var response = await Requests.get("http://192.168.43.208:8000/v1/get-patient-details");
    String body = response.content();
    Map<String, dynamic> myMap = json.decode(body);
    List jsonData = myMap['data'];
    return jsonData;
  }

  static Future getPatientDetails(id) async {
    
    var response = await Requests.get("http://192.168.43.208:8000/v1/get-patient-details-by-id/" + id);
    String body = response.content();
    Map<String, dynamic> myMap = json.decode(body);
    List jsonData = myMap['data'];
    return jsonData;
  }

  static Future getPatientBeDetails(id) async {
   
    var requestBody = {
      "request_type":"getbedetails",
	    "p_id":id
    };
    var response = await Requests.post("http://192.168.43.208:8000/v1/get-be",
      body: requestBody,
      bodyEncoding: RequestBodyEncoding.JSON,
    );

    var statusCode = response.statusCode;
    if(statusCode!=200) {
      return null;
    }
    String body = response.content();
    Map<String, dynamic> myMap = json.decode(body);
    List jsonData = myMap['data'];
    return jsonData;

  }

  static Future getPatientFishDetails(id) async {
    var requestBody = {
      "request_type":"getfishdetails",
	    "p_id":id
    };
    var response = await Requests.post("http://192.168.43.208:8000/v1/get-fish",
      body: requestBody,
      bodyEncoding: RequestBodyEncoding.JSON,
    );

    var statusCode = response.statusCode;
    if(statusCode!=200) {
      return null;
    }
    String body = response.content();
    Map<String, dynamic> myMap = json.decode(body);
    List jsonData = myMap['data'];
    return jsonData;

  }

  static Future addbeDetails(requestBody) async {

    var response = await Requests.post("http://192.168.43.208:8000/v1/add-be",
      body: requestBody, 
      bodyEncoding: RequestBodyEncoding.JSON
    );

    var statusCode = response.statusCode;
    return statusCode;
  }

  static Future addFishDetails(requestBody) async {

    var response = await Requests.post("http://192.168.43.208:8000/v1/add-fish",
      body: requestBody, 
      bodyEncoding: RequestBodyEncoding.JSON
    );

    var statusCode = response.statusCode;
    return statusCode;


  }

}