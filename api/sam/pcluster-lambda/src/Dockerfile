FROM public.ecr.aws/lambda/python:3.8

COPY entrypoint.py app.py requirements.txt ./
#ADD api ./api
ADD openapi_server ./openapi_server

RUN python3.8 -m pip install -r requirements.txt -t .

# Command can be overwritte by providing a different command in the template directly.
CMD ["entrypoint.lambda_handler"]
