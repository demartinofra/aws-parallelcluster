# coding: utf-8

from __future__ import absolute_import
import unittest

from flask import json
from six import BytesIO

from openapi_server.models.bad_request_exception_response_content import BadRequestExceptionResponseContent  # noqa: E501
from openapi_server.models.describe_dcv_session_manager_endpoint_response_content import DescribeDcvSessionManagerEndpointResponseContent  # noqa: E501
from openapi_server.models.internal_service_exception_response_content import InternalServiceExceptionResponseContent  # noqa: E501
from openapi_server.models.limit_exceeded_exception_response_content import LimitExceededExceptionResponseContent  # noqa: E501
from openapi_server.models.not_found_exception_response_content import NotFoundExceptionResponseContent  # noqa: E501
from openapi_server.models.unauthorized_client_error_response_content import UnauthorizedClientErrorResponseContent  # noqa: E501
from openapi_server.test import BaseTestCase


class TestDCVController(BaseTestCase):
    """DCVController integration test stubs"""

    def test_describe_dcv_session_manager_endpoint(self):
        """Test case for describe_dcv_session_manager_endpoint

        
        """
        query_string = [('region', 'region_example')]
        headers = { 
            'Accept': 'application/json',
            'aws.auth.sigv4': 'special-key',
        }
        response = self.client.open(
            '/v3/clusters/{cluster_id}/dcv'.format(cluster_id='cluster_id_example'),
            method='GET',
            headers=headers,
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))


if __name__ == '__main__':
    unittest.main()
