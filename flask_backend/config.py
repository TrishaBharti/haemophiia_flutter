import os

BASE_DIR = os.path.abspath(os.path.dirname(__file__))

SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:manu1995@localhost/haemophilia'
SQLALCHEMY_TRACK_MODIFICATIONS = True
