from app.mod_main.models.patient import Patient

from flask import Blueprint
from flask_restful import reqparse
from app import db
import time

patient_details = Blueprint('patient', __name__, url_prefix='/v1')

@patient_details.route('/add-patient', methods=['POST'])
def add_patient():
    
    json_patient_id = ""
    
    try:
        exception_flag = False
        parser = reqparse.RequestParser()
        parser.add_argument('name', type=str, required=True, help="This field cannot be left blank")
        parser.add_argument('mobile_number', type=str, required=True, help="This field cannot be left blank")
        parser.add_argument('blood_group', type=str, required=True, help="This field cannot be left blank")
        parser.add_argument('factor_deficiency', type=str, required=True, help="This field cannot be left blank")
        parser.add_argument('factor_assay', type=int, required=True, help="This field cannot be left blank")
        
        
        data = parser.parse_args()
        
        
        mob_data = Patient.query.filter_by(mobile_number=data['mobile_number']).count()
        print(mob_data)
        if(mob_data>0):
            return {'message':'The data is already present!'}, 422
        
        patient_obj = Patient()
        patient_obj.name = data['name']
        patient_obj.mobile_number = data['mobile_number']
        patient_obj.blood_group = data['blood_group']
        patient_obj.factor_deficiency = data['factor_deficiency']
        patient_obj.factor_assay = data['factor_assay']
        
        db.session.add(patient_obj)
        db.session.commit()
        time.sleep(2)
        json_patient_id = patient_obj.id
    
    except Exception as ex:
        print(ex)
        exception_flag = True
        db.session.rollback()
        
    finally:
        db.session.close()
        
    if(exception_flag):
        return {'message':'Error!'}, 500
        
    else:
        return {'message':'Patient details stored successfully', 'id':json_patient_id}, 200
    
@patient_details.route('/get-patient-details', methods=['GET'])
def get_patient_details():
    exception_flag = False
    data_list = []
    
    try:
        data = Patient.query.all()
        
        for res in data:
            json_dict = {}
            json_dict['id'] = res.id
            json_dict['name'] = res.name
    
            data_list.append(json_dict)

    except Exception as ex:
        print(ex)
        exception_flag = True
    finally:
        db.session.close()
    
    if(exception_flag):
        return {'message':'Error!'}, 500
    else:
        return {'data':data_list}
    
@patient_details.route('/get-patient-details-by-id/<passed_id>', methods=['GET'])
def get_patient_details_by_id(passed_id):
    exception_flag = False
    data_list = []
    
    try:
        data = Patient.query.filter_by(id=passed_id).first()
        
        if(data==None):
            return {'message':'Patient data is not present!'}, 404
        
        json_dict = {}
        json_dict['id'] = data.id
        json_dict['name'] = data.name
        json_dict['mobile_number'] = data.mobile_number
        json_dict['blood_group'] = data.blood_group
        json_dict['factor_deficiency'] = data.factor_deficiency
        json_dict['factor_assay'] = data.factor_assay

        data_list.append(json_dict)

    except Exception as ex:
        print(ex)
        exception_flag = True
    finally:
        db.session.close()
    
    if(exception_flag):
        return {'message':'Error!'}, 500
    else:
        return {'data':data_list}
        
        
        
        
