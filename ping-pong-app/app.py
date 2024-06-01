from flask import Flask
from flask import jsonify

app = Flask(__name__)

@app.route('/v1/ping')
def ping():
    return jsonify({ 'ping': 'pong' })

@app.errorhandler(404)
def not_found_error(error):
    return jsonify({'error': 'Not found'}), 404

@app.errorhandler(500)
def internal_error(error):
    return jsonify({'error': 'Internal server error'}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
