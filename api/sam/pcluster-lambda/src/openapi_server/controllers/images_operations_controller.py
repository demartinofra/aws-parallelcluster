import connexion
import six

from openapi_server.models.bad_request_exception_response_content import BadRequestExceptionResponseContent  # noqa: E501
from openapi_server.models.internal_service_exception_response_content import InternalServiceExceptionResponseContent  # noqa: E501
from openapi_server.models.limit_exceeded_exception_response_content import LimitExceededExceptionResponseContent  # noqa: E501
from openapi_server.models.list_official_images_response_content import ListOfficialImagesResponseContent  # noqa: E501
from openapi_server.models.unauthorized_client_error_response_content import UnauthorizedClientErrorResponseContent  # noqa: E501
from openapi_server import util


def list_official_images(region, version=None, os=None, architecture=None, next_token=None, x_parallelcluster_version=None):  # noqa: E501
    """list_official_images

    Describe ParallelCluster AMIs. # noqa: E501

    :param region: AWS Region
    :type region: str
    :param version: ParallelCluster version to retrieve AMIs for.
    :type version: str
    :param os: Filter by OS distribution
    :type os: str
    :param architecture: Filter by architecture
    :type architecture: str
    :param next_token: 
    :type next_token: str
    :param x_parallelcluster_version: Forces a specific ParallelCluster version to be used when handling this request.
    :type x_parallelcluster_version: str

    :rtype: ListOfficialImagesResponseContent
    """
    return 'do some magic!'
