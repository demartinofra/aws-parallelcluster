import serverless_wsgi

from app import ParallelClusterApi

pcluster_api = ParallelClusterApi()


def lambda_handler(event, context):
    print(event)
    return serverless_wsgi.handle_request(pcluster_api.app, event, context)
