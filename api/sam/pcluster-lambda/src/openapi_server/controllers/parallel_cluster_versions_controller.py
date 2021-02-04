import connexion
import six

from openapi_server.models.bad_request_exception_response_content import BadRequestExceptionResponseContent  # noqa: E501
from openapi_server.models.describe_parallel_cluster_versions_response_content import DescribeParallelClusterVersionsResponseContent  # noqa: E501
from openapi_server.models.internal_service_exception_response_content import InternalServiceExceptionResponseContent  # noqa: E501
from openapi_server.models.limit_exceeded_exception_response_content import LimitExceededExceptionResponseContent  # noqa: E501
from openapi_server.models.unauthorized_client_error_response_content import UnauthorizedClientErrorResponseContent  # noqa: E501
from openapi_server import util


def describe_parallel_cluster_versions():  # noqa: E501
    """describe_parallel_cluster_versions

    Describe the supported ParallelCluster versions. # noqa: E501


    :rtype: DescribeParallelClusterVersionsResponseContent
    """
    return 'do some magic!'
