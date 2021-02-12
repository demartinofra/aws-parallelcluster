namespace parallelcluster

@readonly
@http(method: "GET", uri: "/v3/clusters/{clusterId}", code: 200)
@tags(["Cluster Operations"])
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
    region: Region,
//     @httpHeader("x-parallelcluster-version")
//     @documentation("Forces a specific ParallelCluster version to be used when handling this request.")
//     forceVersion: Version,
}
