from app import db

import datetime
from sqlalchemy.dialects.mysql import INTEGER

class FISH(db.Model):
    
    __tablename__ = "fish"
    
    id = db.Column(INTEGER(unsigned=True), primary_key=True)
    grooming = db.Column(db.Integer)
    bathing = db.Column(db.Integer)
    dressing = db.Column(db.Integer)
    chair = db.Column(db.Integer)
    squatting = db.Column(db.Integer)
    walking = db.Column(db.Integer)
    running = db.Column(db.Integer)
    stairs = db.Column(db.Integer)
    total_score = db.Column(db.Integer)
    
    p_id = db.Column(INTEGER(unsigned=True), db.ForeignKey('patient.id'), nullable=True)
    patient = db.relationship('Patient')
    
    evaluation_date = db.Column(db.String(20))
    
    created_at = db.Column(db.DateTime, default=datetime.datetime.now(), nullable=False)
    updated_at = db.Column(db.DateTime, default=datetime.datetime.now(), nullable=False)