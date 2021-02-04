import connexion
import six

from openapi_server.models.bad_request_exception_response_content import BadRequestExceptionResponseContent  # noqa: E501
from openapi_server.models.build_image_bad_request_exception_response_content import BuildImageBadRequestExceptionResponseContent  # noqa: E501
from openapi_server.models.build_image_request_content import BuildImageRequestContent  # noqa: E501
from openapi_server.models.build_image_response_content import BuildImageResponseContent  # noqa: E501
from openapi_server.models.conflict_exception_response_content import ConflictExceptionResponseContent  # noqa: E501
from openapi_server.models.delete_image_response_content import DeleteImageResponseContent  # noqa: E501
from openapi_server.models.describe_image_response_content import DescribeImageResponseContent  # noqa: E501
from openapi_server.models.internal_service_exception_response_content import InternalServiceExceptionResponseContent  # noqa: E501
from openapi_server.models.limit_exceeded_exception_response_content import LimitExceededExceptionResponseContent  # noqa: E501
from openapi_server.models.list_images_response_content import ListImagesResponseContent  # noqa: E501
from openapi_server.models.not_found_exception_response_content import NotFoundExceptionResponseContent  # noqa: E501
from openapi_server.models.unauthorized_client_error_response_content import UnauthorizedClientErrorResponseContent  # noqa: E501
from openapi_server.models.validation_level import ValidationLevel  # noqa: E501
from openapi_server import util


def build_image(build_image_request_content, version=None, suppress_validators=None, validation_failure_level=None, dryrun=None, rollback_on_failure=None):  # noqa: E501
    """build_image

    Create a custom ParallelCluster image in a given region. # noqa: E501

    :param build_image_request_content: 
    :type build_image_request_content: dict | bytes
    :param version: ParallelCluster version to use when creating the image. This option will only be available in case the API has support for multiple ParallelCluster versions
    :type version: str
    :param suppress_validators: Identifies one or more config validators to suppress. Format: ALL|id:$value|level:(info|error|warning)|type:$value
    :type suppress_validators: List[str]
    :param validation_failure_level: Min validation level that will cause the creation to fail. Defaults to &#39;error&#39;.
    :type validation_failure_level: dict | bytes
    :param dryrun: Only perform request validation without creating any resource. It can be used to validate the image configuration. Response code: 200
    :type dryrun: bool
    :param rollback_on_failure: When set it automatically initiates an image stack rollback on failures. Defaults to true.
    :type rollback_on_failure: bool

    :rtype: BuildImageResponseContent
    """
    if connexion.request.is_json:
        build_image_request_content = BuildImageRequestContent.from_dict(connexion.request.get_json())  # noqa: E501
    if connexion.request.is_json:
        validation_failure_level =  ValidationLevel.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'


def delete_image(image_id, region, x_parallelcluster_version=None):  # noqa: E501
    """delete_image

    Initiate the deletion of an image. # noqa: E501

    :param image_id: Name of the image
    :type image_id: str
    :param region: AWS Region
    :type region: str
    :param x_parallelcluster_version: Forces a specific ParallelCluster version to be used when handling this request.
    :type x_parallelcluster_version: str

    :rtype: DeleteImageResponseContent
    """
    return 'do some magic!'


def describe_image(image_id, region, x_parallelcluster_version=None):  # noqa: E501
    """describe_image

    Get detailed information about an existing image. # noqa: E501

    :param image_id: Name of the image
    :type image_id: str
    :param region: AWS Region
    :type region: str
    :param x_parallelcluster_version: Forces a specific ParallelCluster version to be used when handling this request.
    :type x_parallelcluster_version: str

    :rtype: DescribeImageResponseContent
    """
    return 'do some magic!'


def list_images(region, next_token=None, show_deleted=None, x_parallelcluster_version=None):  # noqa: E501
    """list_images

    Retrieve the list of existing custom images managed by the API. # noqa: E501

    :param region: List Images built into a given AWS Region
    :type region: str
    :param next_token: 
    :type next_token: str
    :param show_deleted: List deleted images.
    :type show_deleted: bool
    :param x_parallelcluster_version: Forces a specific ParallelCluster version to be used when handling this request.
    :type x_parallelcluster_version: str

    :rtype: ListImagesResponseContent
    """
    return 'do some magic!'
