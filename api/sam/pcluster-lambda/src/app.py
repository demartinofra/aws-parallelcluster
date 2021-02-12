import connexion
from flask import request
from openapi_server import encoder


class ParallelClusterApi:
    def __init__(self):
        app = connexion.App(__name__, specification_dir='./openapi_server/openapi/')
        app.app.json_encoder = encoder.JSONEncoder
        app.add_api('openapi.yaml',
                    arguments={'title': 'ParallelCluster'},
                    pythonic_params=True,
                    options={"swagger_ui": False})
        self.app = app

    def start_server(self, port=8080):
        self.app.run(port=port, debug=True)


# HTTP_METHODS = ['GET', 'HEAD', 'POST', 'PUT', 'DELETE', 'CONNECT', 'OPTIONS', 'TRACE', 'PATCH']
# @app.app.route('/', defaults={'path': ''}, methods=HTTP_METHODS)
# @app.app.route('/<path:path>', methods=HTTP_METHODS)
# def catch_all(path):
#     response = {
#         "body": request.get_json(),
#         "path": path,
#     }
#     return response


if __name__ == '__main__':
    ParallelClusterApi().start_server()
