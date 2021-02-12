#!/usr/bin/env python3

from aws_cdk import core

from api.api_stack import BaseApiStack


app = core.App()
BaseApiStack(app, "api")

app.synth()
