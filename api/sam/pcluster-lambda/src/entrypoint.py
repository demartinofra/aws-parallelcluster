import serverless_wsgi
# from api.app import app
from app import ParallelClusterApi


def lambda_handler(event, context):
    print("invoking handler")
    pcluster_api = ParallelClusterApi()
    return serverless_wsgi.handle_request(pcluster_api.app, event, context)
