from app.mod_main.models.fish import FISH
from app.mod_main.models.patient import Patient

from flask import Blueprint
from flask_restful import reqparse
from app import db
import time

fish_blueprint = Blueprint('fish', __name__, url_prefix='/v1')

@fish_blueprint.route('/add-fish', methods=['POST'])
def add_fish_details():
    
    json_fish_id = ""
    try:
        exception_flag = False
        parser = reqparse.RequestParser()
        
        parser.add_argument('grooming', type=int, required=True, help="This field cannot be left blank")
        parser.add_argument('bathing', type=int, required=True, help="This field cannot be left blank")
        parser.add_argument('dressing', type=int, required=True, help="This field cannot be left blank")
        parser.add_argument('chair', type=int, required=True, help="This field cannot be left blank")
        parser.add_argument('squatting', type=int, required=True, help="This field cannot be left blank")
        parser.add_argument('walking', type=int, required=True, help="This field cannot be left blank")
        parser.add_argument('running', type=int, required=True, help="This field cannot be left blank")
        parser.add_argument('stairs', type=int, required=True, help="This field cannot be left blank")
        parser.add_argument('evaluation_date', type=str, required=True, help="This field cannot be left blank")
        parser.add_argument('p_id', type=int, required=True, help="This field cannot be left blank")
        
        data = parser.parse_args()
        
        fish_obj = FISH()
        
        fish_obj.grooming = data['grooming']
        fish_obj.bathing = data['bathing']
        fish_obj.dressing = data['dressing']
        fish_obj.chair = data['chair']
        fish_obj.squatting = data['squatting']
        fish_obj.walking = data['walking']
        fish_obj.running = data['running']
        fish_obj.stairs = data['stairs']
        fish_obj.total_score = (data['grooming'] + data['bathing'] + data['dressing'] + data['chair'] + data['squatting'] + data['walking'] + data['running'] + data['stairs'])
        fish_obj.evaluation_date = data['evaluation_date']
        fish_obj.p_id = data['p_id']
        
        
        if(Patient.query.filter_by(id=fish_obj.p_id).first()==None):
            return {'message':'Patient id is not present!'}, 422
        
        db.session.add(fish_obj)
        db.session.commit()
        
        time.sleep(2)
        json_fish_id = fish_obj.id
        
        
    except Exception as ex:
        print(ex)
        exception_flag = True
        db.session.rollback()
        
    finally:
        db.session.close()
        
    if(exception_flag):
        return {'message':'Error!'}, 500
        
    else:
        return {'message':'Bleeding episodes data sorted successfully', 'id':json_fish_id}, 200
    
    return {'message':'Hello!'}, 200

@fish_blueprint.route('/get-fish', methods=['POST'])
def get_fish_details():
    json_list = []
    try:
        exception_flag = False
        
        parser = reqparse.RequestParser()
        
        parser.add_argument('request_type', type=str, required=True, help="This field cannot be left blank")
        parser.add_argument('p_id', type=int, required=True, help="This field cannot be left blank")
        
        data = parser.parse_args()
        
        evaluation_date = data['request_type']
        patient_id = data['p_id']
        
        if(evaluation_date!="getfishdetails"):
            return {'message':'Wrong request type'}, 422
        
        patient_data = FISH.query.filter_by(p_id=patient_id).all()
        
        if(len(patient_data)==0):
            return {'message':'Patient id is not present'}, 404
        
        
        for res in patient_data:
            json_dict = {}
            
            json_dict['id'] = res.id
            json_dict['grooming'] = res.grooming
            json_dict['bathing'] = res.bathing
            json_dict['dressing'] = res.dressing
            json_dict['chair'] = res.chair
            json_dict['squatting'] = res.squatting
            json_dict['walking'] = res.walking
            json_dict['running'] = res.running
            json_dict['stairs'] = res.stairs
            json_dict['evaluation_date'] = res.evaluation_date
            json_dict['p_id'] = res.p_id
            json_dict['total_score'] = res.total_score
            
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
