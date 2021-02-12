from sys import path

import json

from aws_cdk import core
from aws_cdk.aws_apigateway import ApiDefinition, SpecRestApi
from aws_cdk.aws_apigatewayv2 import CfnApi, CfnDeployment, CfnStage, HttpApi
from aws_cdk.aws_iam import PolicyStatement, Role, ServicePrincipal
from aws_cdk.aws_lambda import DockerImageCode, DockerImageFunction, Function, Code, Runtime
# from aws_cdk.aws_sam import CfnApi


class BaseApiStack(core.Stack):

    def __init__(self, scope: core.Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        with open("../model/openapi/ParallelCluster.openapi.json") as openapi_file:
            openapi_definition = json.load(openapi_file)
        api = CfnApi(
            self,
            id="ParallelClusterApi",
            body=openapi_definition,
        )
        CfnStage(self, id="ParallelClusterApiStage", api_id=api.ref, auto_deploy=True, stage_name="$default")
        handler = DockerImageFunction(
            self,
            id="ParallelClusterFunction",
            code=DockerImageCode.from_image_asset("../sam/pcluster-lambda/src"),
        )
        handler.node.default_child.override_logical_id("ParallelClusterFunction")
        role = Role(self, "APIGatewayExecutionRole",
                    assumed_by=ServicePrincipal("apigateway.amazonaws.com")
                    )
        handler.grant_invoke(role)
        role.node.default_child.override_logical_id("APIGatewayExecutionRole")
        # role.add_to_policy(PolicyStatement(
        #     resources=[handler.ar],
        #     actions=["lambda:InvokeFunction"]
        # ))
        # api_definition = ApiDefinition.from_asset("../model/openapi/ParallelCluster.openapi.json")
        # SpecRestApi(self, "ParallelClusterApi", api_definition=api_definition)
