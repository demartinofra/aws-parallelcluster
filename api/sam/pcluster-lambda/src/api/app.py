from flask import Flask
from flask import request
from flask import jsonify

app = Flask(__name__)
HTTP_METHODS = ['GET', 'HEAD', 'POST', 'PUT', 'DELETE', 'CONNECT', 'OPTIONS', 'TRACE', 'PATCH']


@app.route("/cats")
def cats():
    return "Cats"


@app.route("/dogs/<id>")
def dog(id):
    return "Dog"


@app.route('/', defaults={'path': ''}, methods=HTTP_METHODS)
@app.route('/<path:path>', methods=HTTP_METHODS)
def catch_all(path):
    response = {
        "body": request.get_json(),
        "path": path,
    }
    return response

