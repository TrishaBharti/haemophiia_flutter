from app import app
app.run(host='127.0.0.1', port=8080, debug=True)

# To call the server endpoint through android emulator
# app.run(host='0.0.0.0', port=8000, debug=True)