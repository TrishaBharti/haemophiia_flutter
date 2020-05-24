import os

BASE_DIR = os.path.abspath(os.path.dirname(__file__))

SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:hi@localhost/haemophilia'
SQLALCHEMY_TRACK_MODIFICATIONS = True
