from app.mod_main.models.bleeding_episodes import BleedingEpisodes
from app.mod_main.models.patient import Patient

from flask import Blueprint
from flask_restful import reqparse
from app import db
import time

bleeding_episodes = Blueprint('be', __name__, url_prefix='/v1')
@bleeding_episodes.route('/add-be', methods=['POST'])
def add_bleeding_episodes():
    json_be_id = ""
    
    try:
        exception_flag = False
        parser = reqparse.RequestParser()
        
        parser.add_argument('lknee_trauma', type=int, required=True, help="This field cannot be left blank")
        parser.add_argument('lknee_spontaneous', type=int, required=True, help="This field cannot be left blank")
        parser.add_argument('lknee_minor', type=int, required=True, help="This field cannot be left blank")
        parser.add_argument('lknee_major', type=int, required=True, help="This field cannot be left blank")
        parser.add_argument('rknee_trauma', type=int, required=True, help="This field cannot be left blank")
        parser.add_argument('rknee_spontaneous', type=int, required=True, help="This field cannot be left blank")
        parser.add_argument('rknee_minor', type=int, required=True, help="This field cannot be left blank")
        parser.add_argument('rknee_major', type=int, required=True, help="This field cannot be left blank")
        parser.add_argument('p_id', type=int, required=True, help="This field cannot be left blank")
        parser.add_argument('evaluation_date', type=str, required=True, help="This field cannot be left blank")
        
        data = parser.parse_args()
        
        be_obj = BleedingEpisodes()
        
        be_obj.lknee_trauma = data['lknee_trauma']
        be_obj.lknee_spontaneous = data['lknee_spontaneous']
        be_obj.lknee_minor = data['lknee_minor']
        be_obj.lknee_major = data['lknee_major']
        be_obj.rknee_trauma = data['rknee_trauma']
        be_obj.rknee_spontaneous = data['rknee_spontaneous']
        be_obj.rknee_minor = data['rknee_minor']
        be_obj.rknee_major = data['rknee_major']
        
        be_obj.total_lknee_value = (data['lknee_trauma'] + data['lknee_spontaneous'] + data['lknee_minor'] + data['lknee_major'])
        be_obj.total_rknee_value = (data['rknee_trauma'] + data['rknee_spontaneous'] + data['rknee_minor'] + data['rknee_major'])
        be_obj.p_id = data['p_id']
        be_obj.evaluation_date = data['evaluation_date']
        
        
        if(Patient.query.filter_by(id=be_obj.p_id).first()==None):
            return {'message':'Patient id is not present!'}, 422
        
        db.session.add(be_obj)
        db.session.commit()
        
        time.sleep(2)
        json_be_id = be_obj.id
        
        
    except Exception as ex:
        print(ex)
        exception_flag = True
        db.session.rollback()
        
    finally:
        db.session.close()
        
    if(exception_flag):
        return {'message':'Error!'}, 500
        
    else:
        return {'message':'Bleeding episodes data sorted successfully', 'id':json_be_id}, 200
    
@bleeding_episodes.route('/get-be', methods=['POST'])
def get_bleeding_episodes():
    
    json_list = []
    try:
        exception_flag = False
        
        parser = reqparse.RequestParser()
        
        parser.add_argument('request_type', type=str, required=True, help="This field cannot be left blank")
        parser.add_argument('p_id', type=int, required=True, help="This field cannot be left blank")
        
        data = parser.parse_args()
        
        evaluation_date = data['request_type']
        patient_id = data['p_id']
        
        if(evaluation_date!="getbedetails"):
            return {'message':'Wrong request type'}, 422
        
        patient_data = BleedingEpisodes.query.filter_by(p_id=patient_id).all()
        
        if(len(patient_data)==0):
            return {'message':'Patient id is not present'}, 404
        
        
        for res in patient_data:
            json_dict = {}
            
            json_dict['id'] = res.id
            json_dict['lknee_trauma'] = res.lknee_trauma
            json_dict['lknee_spontaneous'] = res.lknee_spontaneous
            json_dict['lknee_major'] = res.lknee_major
            json_dict['lknee_minor'] = res.lknee_minor
            json_dict['rknee_trauma'] = res.rknee_trauma
            json_dict['rknee_spontaneous'] = res.rknee_spontaneous
            json_dict['rknee_major'] = res.rknee_major
            json_dict['rknee_minor'] = res.rknee_minor
            json_dict['tlknee_value'] = res.total_lknee_value
            json_dict['trknee_value'] = res.total_rknee_value
            json_dict['evaluation_date'] = res.evaluation_date
            
            json_list.append(json_dict)
        
    except Exception as ex:
        print(ex)
        exception_flag = True
    finally:
        db.session.close()
    
    if(exception_flag):
        return {'message':'Error!'}, 500
    
    else:
        return {'data':json_list}, 200
