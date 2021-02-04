# coding: utf-8

from __future__ import absolute_import
import unittest

from flask import json
from six import BytesIO

from openapi_server.models.bad_request_exception_response_content import BadRequestExceptionResponseContent  # noqa: E501
from openapi_server.models.describe_compute_fleet_status_response_content import DescribeComputeFleetStatusResponseContent  # noqa: E501
from openapi_server.models.internal_service_exception_response_content import InternalServiceExceptionResponseContent  # noqa: E501
from openapi_server.models.not_found_exception_response_content import NotFoundExceptionResponseContent  # noqa: E501
from openapi_server.models.unauthorized_client_error_response_content import UnauthorizedClientErrorResponseContent  # noqa: E501
from openapi_server.models.update_compute_fleet_status_request_content import UpdateComputeFleetStatusRequestContent  # noqa: E501
from openapi_server.models.update_compute_fleet_status_response_content import UpdateComputeFleetStatusResponseContent  # noqa: E501
from openapi_server.test import BaseTestCase


class TestClusterComputeFleetController(BaseTestCase):
    """ClusterComputeFleetController integration test stubs"""

    def test_describe_compute_fleet_status(self):
        """Test case for describe_compute_fleet_status

        
        """
        query_string = [('region', 'region_example')]
        headers = { 
            'Accept': 'application/json',
            'aws.auth.sigv4': 'special-key',
        }
        response = self.client.open(
            '/clusters/{cluster_id}/computefleet/status'.format(cluster_id='cluster_id_example'),
            method='GET',
            headers=headers,
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_update_compute_fleet_status(self):
        """Test case for update_compute_fleet_status

        
        """
        update_compute_fleet_status_request_content = { }
        query_string = [('region', 'region_example')]
        headers = { 
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'aws.auth.sigv4': 'special-key',
        }
        response = self.client.open(
            '/clusters/{cluster_id}/computefleet/status'.format(cluster_id='cluster_id_example'),
            method='PATCH',
            headers=headers,
            data=json.dumps(update_compute_fleet_status_request_content),
            content_type='application/json',
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))


if __name__ == '__main__':
    unittest.main()
