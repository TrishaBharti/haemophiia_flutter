from flask import Flask

from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine

from config import SQLALCHEMY_DATABASE_URI
app = Flask("Haemophilia Backend Database")

app.config.from_object('config')
db = SQLAlchemy(app)
engine = create_engine(SQLALCHEMY_DATABASE_URI)


@app.route('/')
def method_name():
   return {'message':'hello world!'}

# Importing Blueprints
from app.mod_main.controllers.patient_details import patient_details as patient
from app.mod_main.controllers.bleeding_episodes import bleeding_episodes as be
from app.mod_main.controllers.fish import fish_blueprint as fish

# Registring the blueprints
app.register_blueprint(patient)
app.register_blueprint(be)
app.register_blueprint(fish)

db.create_all()

