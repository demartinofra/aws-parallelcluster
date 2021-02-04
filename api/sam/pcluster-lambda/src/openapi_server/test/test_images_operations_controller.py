# coding: utf-8

from __future__ import absolute_import
import unittest

from flask import json
from six import BytesIO

from openapi_server.models.bad_request_exception_response_content import BadRequestExceptionResponseContent  # noqa: E501
from openapi_server.models.internal_service_exception_response_content import InternalServiceExceptionResponseContent  # noqa: E501
from openapi_server.models.limit_exceeded_exception_response_content import LimitExceededExceptionResponseContent  # noqa: E501
from openapi_server.models.list_official_images_response_content import ListOfficialImagesResponseContent  # noqa: E501
from openapi_server.models.unauthorized_client_error_response_content import UnauthorizedClientErrorResponseContent  # noqa: E501
from openapi_server.test import BaseTestCase


class TestImagesOperationsController(BaseTestCase):
    """ImagesOperationsController integration test stubs"""

    def test_list_official_images(self):
        """Test case for list_official_images

        
        """
        query_string = [('version', 'version_example'),
                        ('region', 'region_example'),
                        ('os', 'os_example'),
                        ('architecture', 'architecture_example'),
                        ('nextToken', 'next_token_example')]
        headers = { 
            'Accept': 'application/json',
            'x_parallelcluster_version': 'x_parallelcluster_version_example',
            'aws.auth.sigv4': 'special-key',
        }
        response = self.client.open(
            '/images/official',
            method='GET',
            headers=headers,
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))


if __name__ == '__main__':
    unittest.main()
