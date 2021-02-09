import serverless_wsgi
# from api.app import app
from app import ParallelClusterApi

pcluster_api = ParallelClusterApi()


def lambda_handler(event, context):
    return serverless_wsgi.handle_request(pcluster_api.app, event, context)
