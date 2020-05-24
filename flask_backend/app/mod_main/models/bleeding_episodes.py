from app import db

import datetime
from sqlalchemy.dialects.mysql import INTEGER

class BleedingEpisodes(db.Model):
    __tablename__ = 'bleeding_episodes'
    
    id = db.Column(INTEGER(unsigned=True), primary_key=True)
    lknee_trauma = db.Column(db.Integer)
    lknee_spontaneous = db.Column(db.Integer)
    lknee_minor = db.Column(db.Integer)
    lknee_major = db.Column(db.Integer)
    rknee_trauma = db.Column(db.Integer)
    rknee_spontaneous = db.Column(db.Integer)
    rknee_minor = db.Column(db.Integer)
    rknee_major = db.Column(db.Integer)
    total_lknee_value = db.Column(db.Integer)
    total_rknee_value = db.Column(db.Integer)
    
    p_id = db.Column(INTEGER(unsigned=True), db.ForeignKey('patient.id'), nullable=True)
    patient = db.relationship('Patient')
    
    evaluation_date = db.Column(db.String(20))
    
    created_at = db.Column(db.DateTime, default=datetime.datetime.now(), nullable=False)
    updated_at = db.Column(db.DateTime, default=datetime.datetime.now(), nullable=False)
    
    
    
    
    
    