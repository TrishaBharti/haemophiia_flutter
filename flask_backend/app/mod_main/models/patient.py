from app import db

import datetime
from sqlalchemy.dialects.mysql import INTEGER

class Patient(db.Model):
    __tablename__ = "patient"
    
    id = db.Column(INTEGER(unsigned=True), primary_key=True)
    name = db.Column(db.String(20))
    mobile_number = db.Column(db.String(20))
    blood_group = db.Column(db.String(20))
    factor_deficiency = db.Column(db.String(20))
    factor_assay = db.Column(db.Integer)
    
    created_at = db.Column(db.DateTime, default=datetime.datetime.now(), nullable=False)
    updated_at = db.Column(db.DateTime, default=datetime.datetime.now(), nullable=False)
    
    
    
    