namespace parallelcluster

@readonly
@http(method: "GET", uri: "/clusters/{clusterId}/dcv", code: 200)
@tags(["DCV"])
@documentation("Provides details on how to connect to the DCV session manager endpoint configured for the cluster.")
operation DescribeDcvSessionManagerEndpoint {
    input: DescribeDcvSessionManagerEndpointInput,
    output: DescribeDcvSessionManagerEndpointOutput,
    errors: [
        InternalServiceException,
        BadRequestException,
        NotFoundException,
        UnauthorizedClientError,
        LimitExceededException,
    ]
}

structure DescribeDcvSessionManagerEndpointInput {
    @httpLabel
    @required
    clusterId: ClusterId,

    @httpQuery("region")
    @required
    region: Region,
}

structure DescribeDcvSessionManagerEndpointOutput {
    @required
    clientId: String,
    @required
    clientSecret: String,
    @required
    @documentation("https://<broker-hostname>:<port>")
    sessionManagerEndpoint: String,
}
