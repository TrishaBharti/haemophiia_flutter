import 'package:requests/requests.dart';
import 'dart:convert';

class FlaskServices{

  static void addPatient(name, phoneNumber, bloodGroup, factorD, factorA) async{

    var requestBody = {
      "name":name,
      "mobile_number":phoneNumber,
      "blood_group":bloodGroup,
      "factor_deficiency":factorD,
      "factor_assay":factorA
    };

    var response = await Requests.post("http://10.0.2.2:8080/v1/add-patient",
      bodyEncoding: RequestBodyEncoding.JSON,
      body: requestBody
    );
    print(response.content());
  }  

  static Future getPatients() async {
    var response = await Requests.get("http://10.0.2.2:8080/v1/get-patient-details");
    String body = response.content();
    Map<String, dynamic> myMap = json.decode(body);
    List jsonData = myMap['data'];
    return jsonData;
  }

}