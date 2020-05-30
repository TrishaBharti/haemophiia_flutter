import os

BASE_DIR = os.path.abspath(os.path.dirname(__file__))

SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:pass@localhost/haemo'
SQLALCHEMY_TRACK_MODIFICATIONS = True
