import connexion
import six

from openapi_server.models.bad_request_exception_response_content import BadRequestExceptionResponseContent  # noqa: E501
from openapi_server.models.cluster_status import ClusterStatus  # noqa: E501
from openapi_server.models.conflict_exception_response_content import ConflictExceptionResponseContent  # noqa: E501
from openapi_server.models.create_cluster_bad_request_exception_response_content import CreateClusterBadRequestExceptionResponseContent  # noqa: E501
from openapi_server.models.create_cluster_request_content import CreateClusterRequestContent  # noqa: E501
from openapi_server.models.create_cluster_response_content import CreateClusterResponseContent  # noqa: E501
from openapi_server.models.delete_cluster_response_content import DeleteClusterResponseContent  # noqa: E501
from openapi_server.models.describe_cluster_response_content import DescribeClusterResponseContent  # noqa: E501
from openapi_server.models.internal_service_exception_response_content import InternalServiceExceptionResponseContent  # noqa: E501
from openapi_server.models.limit_exceeded_exception_response_content import LimitExceededExceptionResponseContent  # noqa: E501
from openapi_server.models.list_clusters_response_content import ListClustersResponseContent  # noqa: E501
from openapi_server.models.not_found_exception_response_content import NotFoundExceptionResponseContent  # noqa: E501
from openapi_server.models.unauthorized_client_error_response_content import UnauthorizedClientErrorResponseContent  # noqa: E501
from openapi_server.models.update_cluster_bad_request_exception_response_content import UpdateClusterBadRequestExceptionResponseContent  # noqa: E501
from openapi_server.models.update_cluster_request_content import UpdateClusterRequestContent  # noqa: E501
from openapi_server.models.update_cluster_response_content import UpdateClusterResponseContent  # noqa: E501
from openapi_server.models.validation_level import ValidationLevel  # noqa: E501
from openapi_server import util


def create_cluster(version=None, suppress_validators=None, validation_failure_level=None, dryrun=None, rollback_on_failure=None):  # noqa: E501
    """create_cluster

    Create a ParallelCluster managed cluster in a given region. # noqa: E501

    :param create_cluster_request_content: 
    :type create_cluster_request_content: dict | bytes
    :param version: ParallelCluster version to use when creating the cluster. This option will only be available in case the API has support for multiple ParallelCluster versions
    :type version: str
    :param suppress_validators: Identifies one or more config validators to suppress. Format: ALL|id:$value|level:(info|error|warning)|type:$value
    :type suppress_validators: List[str]
    :param validation_failure_level: Min validation level that will cause the creation to fail. Defaults to &#39;error&#39;.
    :type validation_failure_level: dict | bytes
    :param dryrun: Only perform request validation without creating any resource. It can be used to validate the cluster configuration. Response code: 200
    :type dryrun: bool
    :param rollback_on_failure: When set it automatically initiates a cluster stack rollback on failures. Defaults to true.
    :type rollback_on_failure: bool

    :rtype: CreateClusterResponseContent
    """
    if connexion.request.is_json:
        create_cluster_request_content = CreateClusterRequestContent.from_dict(connexion.request.get_json())  # noqa: E501
    if connexion.request.is_json:
        validation_failure_level =  ValidationLevel.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'


def delete_cluster(cluster_id, region=None, retain_logs=None):  # noqa: E501
    """delete_cluster

    Initiate the deletion of a cluster. # noqa: E501

    :param cluster_id: Name of the cluster
    :type cluster_id: str
    :param region: AWS Region. Defaults to the region the API is deployed to.
    :type region: str
    :param retain_logs: Retain cluster logs on delete. Defaults to True.
    :type retain_logs: bool

    :rtype: DeleteClusterResponseContent
    """
    return 'do some magic!'


def describe_cluster(cluster_id, region=None):  # noqa: E501
    """describe_cluster

    Get detailed information about an existing cluster. # noqa: E501

    :param cluster_id: Name of the cluster
    :type cluster_id: str
    :param region: AWS Region. Defaults to the region the API is deployed to.
    :type region: str

    :rtype: DescribeClusterResponseContent
    """
    return 'do some magic!'


def list_clusters(region=None, next_token=None, cluster_status_filter=None):  # noqa: E501
    """list_clusters

    Retrieve the list of existing clusters managed by the API. Deleted clusters are not listed by default. # noqa: E501

    :param region: List clusters deployed to a given AWS Region. Defaults to the AWS region the API is deployed to.
    :type region: str
    :param next_token: 
    :type next_token: str
    :param cluster_status_filter: Filter by cluster status.
    :type cluster_status_filter: list | bytes

    :rtype: ListClustersResponseContent
    """
    if connexion.request.is_json:
        cluster_status_filter = [ClusterStatus.from_dict(d) for d in connexion.request.get_json()]  # noqa: E501
    return 'do some magic!'


def update_cluster(cluster_id, region=None, dryrun=None):  # noqa: E501
    """update_cluster

     # noqa: E501

    :param cluster_id: Name of the cluster
    :type cluster_id: str
    :param update_cluster_request_content: 
    :type update_cluster_request_content: dict | bytes
    :param region: AWS Region. Defaults to the region the API is deployed to.
    :type region: str
    :param dryrun: Only perform request validation without creating any resource. It can be used to validate the cluster configuration and update requirements. Response code: 200
    :type dryrun: bool

    :rtype: UpdateClusterResponseContent
    """
    if connexion.request.is_json:
        update_cluster_request_content = UpdateClusterRequestContent.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'
