import connexion
import six

from openapi_server.models.bad_request_exception_response_content import BadRequestExceptionResponseContent  # noqa: E501
from openapi_server.models.describe_dcv_session_manager_endpoint_response_content import DescribeDcvSessionManagerEndpointResponseContent  # noqa: E501
from openapi_server.models.internal_service_exception_response_content import InternalServiceExceptionResponseContent  # noqa: E501
from openapi_server.models.limit_exceeded_exception_response_content import LimitExceededExceptionResponseContent  # noqa: E501
from openapi_server.models.not_found_exception_response_content import NotFoundExceptionResponseContent  # noqa: E501
from openapi_server.models.unauthorized_client_error_response_content import UnauthorizedClientErrorResponseContent  # noqa: E501
from openapi_server import util


def describe_dcv_session_manager_endpoint(cluster_id, region=None):  # noqa: E501
    """describe_dcv_session_manager_endpoint

    Provides details on how to connect to the DCV session manager endpoint configured for the cluster. # noqa: E501

    :param cluster_id: Name of the cluster
    :type cluster_id: str
    :param region: AWS Region. Defaults to the region the API is deployed to.
    :type region: str

    :rtype: DescribeDcvSessionManagerEndpointResponseContent
    """
    return 'do some magic!'
