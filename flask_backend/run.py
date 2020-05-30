from app import app
app.run(host='192.168.43.208', port=8000, debug=True)

# To call the server endpoint through android emulator
# app.run(host='0.0.0.0', port=8000, debug=True)