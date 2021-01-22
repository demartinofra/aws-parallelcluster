namespace parallelcluster

@readonly
@http(method: "GET", uri: "/clusters/{clusterId}", code: 200)
@tags(["Cluster CRUD"])
@documentation("Get detailed information about an existing cluster.")
operation DescribeCluster {
    input: DescribeClusterInput,
    output: ClusterInfo,
    errors: [
        InternalServiceException,
        BadRequestException,
        NotFoundException,
        UnauthorizedClientError,
        LimitExceededException,
    ]
}

structure DescribeClusterInput {
    @httpLabel
    @required
    clusterId: ClusterId,

    @httpQuery("region")
    @required
    region: Region,
}