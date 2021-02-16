FROM public.ecr.aws/lambda/nodejs:14 AS nodejs_docker

FROM public.ecr.aws/lambda/python:3.8

COPY --from=nodejs_docker /var/lang/bin/node /var/lang/bin
COPY entrypoint.py app.py requirements.txt ./
ADD openapi_server ./openapi_server
RUN python3.8 -m pip install -r requirements.txt -t .

# Command can be overwritte by providing a different command in the template directly.
CMD ["entrypoint.lambda_handler"]
