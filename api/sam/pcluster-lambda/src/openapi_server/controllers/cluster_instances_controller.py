import connexion
import six

from openapi_server.models.bad_request_exception_response_content import BadRequestExceptionResponseContent  # noqa: E501
from openapi_server.models.describe_cluster_instances_response_content import DescribeClusterInstancesResponseContent  # noqa: E501
from openapi_server.models.internal_service_exception_response_content import InternalServiceExceptionResponseContent  # noqa: E501
from openapi_server.models.limit_exceeded_exception_response_content import LimitExceededExceptionResponseContent  # noqa: E501
from openapi_server.models.not_found_exception_response_content import NotFoundExceptionResponseContent  # noqa: E501
from openapi_server.models.unauthorized_client_error_response_content import UnauthorizedClientErrorResponseContent  # noqa: E501
from openapi_server import util


def delete_cluster_instances(cluster_id, region=None, force=None):  # noqa: E501
    """delete_cluster_instances

    Initiate the forced termination of all cluster compute nodes. Does not work with AWS Batch clusters # noqa: E501

    :param cluster_id: Name of the cluster
    :type cluster_id: str
    :param region: AWS Region. Defaults to the region the API is deployed to.
    :type region: str
    :param force: Force the deletion also when the cluster id is not found.
    :type force: bool

    :rtype: None
    """
    return 'do some magic!'


def describe_cluster_instances(cluster_id, region=None, next_token=None, node_type=None, queue_name=None):  # noqa: E501
    """describe_cluster_instances

    Describe the instances belonging to a given cluster. # noqa: E501

    :param cluster_id: Name of the cluster
    :type cluster_id: str
    :param region: AWS Region. Defaults to the region the API is deployed to.
    :type region: str
    :param next_token: 
    :type next_token: str
    :param node_type: 
    :type node_type: str
    :param queue_name: 
    :type queue_name: str

    :rtype: DescribeClusterInstancesResponseContent
    """
    return 'do some magic!'
