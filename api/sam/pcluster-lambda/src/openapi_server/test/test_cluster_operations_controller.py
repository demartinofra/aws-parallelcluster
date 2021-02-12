# coding: utf-8

from __future__ import absolute_import
import unittest

from flask import json
from six import BytesIO

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
from openapi_server.test import BaseTestCase


class TestClusterOperationsController(BaseTestCase):
    """ClusterOperationsController integration test stubs"""

    def test_create_cluster(self):
        """Test case for create_cluster

        
        """
        create_cluster_request_content = {
  "name" : "name",
  "region" : "region",
  "clusterConfiguration" : "clusterConfiguration"
}
        query_string = [('version', 'version_example'),
                        ('suppressValidators', 'suppress_validators_example'),
                        ('validationFailureLevel', {}),
                        ('dryrun', True),
                        ('rollbackOnFailure', True)]
        headers = { 
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'aws.auth.sigv4': 'special-key',
        }
        response = self.client.open(
            '/v3/clusters',
            method='POST',
            headers=headers,
            data=json.dumps(create_cluster_request_content),
            content_type='application/json',
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_delete_cluster(self):
        """Test case for delete_cluster

        
        """
        query_string = [('region', 'region_example'),
                        ('retainLogs', True)]
        headers = { 
            'Accept': 'application/json',
            'aws.auth.sigv4': 'special-key',
        }
        response = self.client.open(
            '/v3/clusters/{cluster_id}'.format(cluster_id='cluster_id_example'),
            method='DELETE',
            headers=headers,
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_describe_cluster(self):
        """Test case for describe_cluster

        
        """
        query_string = [('region', 'region_example')]
        headers = { 
            'Accept': 'application/json',
            'aws.auth.sigv4': 'special-key',
        }
        response = self.client.open(
            '/v3/clusters/{cluster_id}'.format(cluster_id='cluster_id_example'),
            method='GET',
            headers=headers,
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_list_clusters(self):
        """Test case for list_clusters

        
        """
        query_string = [('region', 'region_example'),
                        ('nextToken', 'next_token_example'),
                        ('clusterStatusFilter', {})]
        headers = { 
            'Accept': 'application/json',
            'aws.auth.sigv4': 'special-key',
        }
        response = self.client.open(
            '/v3/clusters',
            method='GET',
            headers=headers,
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_update_cluster(self):
        """Test case for update_cluster

        
        """
        update_cluster_request_content = {
  "clusterConfiguration" : "clusterConfiguration"
}
        query_string = [('region', 'region_example'),
                        ('dryrun', True)]
        headers = { 
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'aws.auth.sigv4': 'special-key',
        }
        response = self.client.open(
            '/v3/clusters/{cluster_id}'.format(cluster_id='cluster_id_example'),
            method='PATCH',
            headers=headers,
            data=json.dumps(update_cluster_request_content),
            content_type='application/json',
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))


if __name__ == '__main__':
    unittest.main()
