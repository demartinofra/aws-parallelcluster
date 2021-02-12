# coding: utf-8

from __future__ import absolute_import
import unittest

from flask import json
from six import BytesIO

from openapi_server.models.bad_request_exception_response_content import BadRequestExceptionResponseContent  # noqa: E501
from openapi_server.models.build_image_bad_request_exception_response_content import BuildImageBadRequestExceptionResponseContent  # noqa: E501
from openapi_server.models.build_image_request_content import BuildImageRequestContent  # noqa: E501
from openapi_server.models.build_image_response_content import BuildImageResponseContent  # noqa: E501
from openapi_server.models.conflict_exception_response_content import ConflictExceptionResponseContent  # noqa: E501
from openapi_server.models.delete_image_response_content import DeleteImageResponseContent  # noqa: E501
from openapi_server.models.describe_image_response_content import DescribeImageResponseContent  # noqa: E501
from openapi_server.models.image_build_status import ImageBuildStatus  # noqa: E501
from openapi_server.models.internal_service_exception_response_content import InternalServiceExceptionResponseContent  # noqa: E501
from openapi_server.models.limit_exceeded_exception_response_content import LimitExceededExceptionResponseContent  # noqa: E501
from openapi_server.models.list_images_response_content import ListImagesResponseContent  # noqa: E501
from openapi_server.models.list_official_images_response_content import ListOfficialImagesResponseContent  # noqa: E501
from openapi_server.models.not_found_exception_response_content import NotFoundExceptionResponseContent  # noqa: E501
from openapi_server.models.unauthorized_client_error_response_content import UnauthorizedClientErrorResponseContent  # noqa: E501
from openapi_server.models.validation_level import ValidationLevel  # noqa: E501
from openapi_server.test import BaseTestCase


class TestImageOperationsController(BaseTestCase):
    """ImageOperationsController integration test stubs"""

    def test_build_image(self):
        """Test case for build_image

        
        """
        build_image_request_content = {
  "imageConfiguration" : "imageConfiguration",
  "name" : "name",
  "region" : "region"
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
            '/v3/images/custom',
            method='POST',
            headers=headers,
            data=json.dumps(build_image_request_content),
            content_type='application/json',
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_delete_image(self):
        """Test case for delete_image

        
        """
        query_string = [('region', 'region_example')]
        headers = { 
            'Accept': 'application/json',
            'aws.auth.sigv4': 'special-key',
        }
        response = self.client.open(
            '/v3/images/custom/{image_id}'.format(image_id='image_id_example'),
            method='DELETE',
            headers=headers,
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_describe_image(self):
        """Test case for describe_image

        
        """
        query_string = [('region', 'region_example')]
        headers = { 
            'Accept': 'application/json',
            'aws.auth.sigv4': 'special-key',
        }
        response = self.client.open(
            '/v3/images/custom/{image_id}'.format(image_id='image_id_example'),
            method='GET',
            headers=headers,
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

    def test_list_images(self):
        """Test case for list_images

        
        """
        query_string = [('region', 'region_example'),
                        ('nextToken', 'next_token_example'),
                        ('imageStatusFilter', {})]
        headers = { 
            'Accept': 'application/json',
            'aws.auth.sigv4': 'special-key',
        }
        response = self.client.open(
            '/v3/images/custom',
            method='GET',
            headers=headers,
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))

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
            'aws.auth.sigv4': 'special-key',
        }
        response = self.client.open(
            '/v3/images/official',
            method='GET',
            headers=headers,
            query_string=query_string)
        self.assert200(response,
                       'Response body is : ' + response.data.decode('utf-8'))


if __name__ == '__main__':
    unittest.main()
