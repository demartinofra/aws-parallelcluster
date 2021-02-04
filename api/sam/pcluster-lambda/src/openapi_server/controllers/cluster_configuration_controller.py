import connexion
import six

from openapi_server.models.bad_request_exception_response_content import BadRequestExceptionResponseContent  # noqa: E501
from openapi_server.models.describe_cluster_configuration_response_content import DescribeClusterConfigurationResponseContent  # noqa: E501
from openapi_server.models.internal_service_exception_response_content import InternalServiceExceptionResponseContent  # noqa: E501
from openapi_server.models.limit_exceeded_exception_response_content import LimitExceededExceptionResponseContent  # noqa: E501
from openapi_server.models.list_cluster_configurations_response_content import ListClusterConfigurationsResponseContent  # noqa: E501
from openapi_server.models.not_found_exception_response_content import NotFoundExceptionResponseContent  # noqa: E501
from openapi_server.models.unauthorized_client_error_response_content import UnauthorizedClientErrorResponseContent  # noqa: E501
from openapi_server import util


def describe_cluster_configuration(cluster_id, config_version, region, x_parallelcluster_version=None):  # noqa: E501
    """describe_cluster_configuration

    Retrieve a specific cluster configuration version. # noqa: E501

    :param cluster_id: Name of the cluster
    :type cluster_id: str
    :param config_version: This can be either the version of the config to retrieve or the &#39;latest&#39; keyword to fetch the latest configuration version.
    :type config_version: str
    :param region: AWS Region
    :type region: str
    :param x_parallelcluster_version: Forces a specific ParallelCluster version to be used when handling this request.
    :type x_parallelcluster_version: str

    :rtype: DescribeClusterConfigurationResponseContent
    """
    return 'do some magic!'


def list_cluster_configurations(cluster_id, region, next_token=None, x_parallelcluster_version=None):  # noqa: E501
    """list_cluster_configurations

    Retrieve the history of cluster configurations for a given cluster # noqa: E501

    :param cluster_id: Name of the cluster
    :type cluster_id: str
    :param region: List clusters deployed to a given AWS Region
    :type region: str
    :param next_token: 
    :type next_token: str
    :param x_parallelcluster_version: Forces a specific ParallelCluster version to be used when handling this request.
    :type x_parallelcluster_version: str

    :rtype: ListClusterConfigurationsResponseContent
    """
    return 'do some magic!'
