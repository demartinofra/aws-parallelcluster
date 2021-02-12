import connexion
import six

from openapi_server.models.bad_request_exception_response_content import BadRequestExceptionResponseContent  # noqa: E501
from openapi_server.models.describe_compute_fleet_status_response_content import DescribeComputeFleetStatusResponseContent  # noqa: E501
from openapi_server.models.internal_service_exception_response_content import InternalServiceExceptionResponseContent  # noqa: E501
from openapi_server.models.limit_exceeded_exception_response_content import LimitExceededExceptionResponseContent  # noqa: E501
from openapi_server.models.not_found_exception_response_content import NotFoundExceptionResponseContent  # noqa: E501
from openapi_server.models.unauthorized_client_error_response_content import UnauthorizedClientErrorResponseContent  # noqa: E501
from openapi_server.models.update_compute_fleet_status_request_content import UpdateComputeFleetStatusRequestContent  # noqa: E501
from openapi_server.models.update_compute_fleet_status_response_content import UpdateComputeFleetStatusResponseContent  # noqa: E501
from openapi_server import util


def describe_compute_fleet_status(cluster_id, region=None):  # noqa: E501
    """describe_compute_fleet_status

    Describe the status of the compute fleet # noqa: E501

    :param cluster_id: Name of the cluster
    :type cluster_id: str
    :param region: AWS Region. Defaults to the region the API is deployed to.
    :type region: str

    :rtype: DescribeComputeFleetStatusResponseContent
    """
    return 'do some magic!'


def update_compute_fleet_status(cluster_id, update_compute_fleet_status_request_content, region=None):  # noqa: E501
    """update_compute_fleet_status

    Update the status of the cluster compute fleet. # noqa: E501

    :param cluster_id: Name of the cluster
    :type cluster_id: str
    :param update_compute_fleet_status_request_content: 
    :type update_compute_fleet_status_request_content: dict | bytes
    :param region: AWS Region. Defaults to the region the API is deployed to.
    :type region: str

    :rtype: UpdateComputeFleetStatusResponseContent
    """
    if connexion.request.is_json:
        update_compute_fleet_status_request_content = UpdateComputeFleetStatusRequestContent.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'
