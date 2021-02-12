namespace parallelcluster

@http(method: "PATCH", uri: "/v3/clusters/{clusterId}", code: 202)
@tags(["Cluster Operations"])
operation UpdateCluster {
    input: UpdateClusterInput,
    output: UpdateClusterOutput,
    errors: [
        InternalServiceException,
        UpdateClusterBadRequestException,
        ConflictException,
        UnauthorizedClientError,
        NotFoundException,
        LimitExceededException,
    ]
}

structure UpdateClusterInput {
    @httpLabel
    @required
    clusterId: ClusterId,

    @httpQuery("region")
    region: Region,
    @httpQuery("dryrun")
    @documentation("Only perform request validation without creating any resource. It can be used to validate the cluster configuration and update requirements. Response code: 200")
    dryrun: Boolean,

    @required
    clusterConfiguration: ClusterConfigurationData,

//     @httpHeader("x-parallelcluster-version")
//     @documentation("Forces a specific ParallelCluster version to be used when handling this request.")
//     forceVersion: Version,
}

structure UpdateClusterOutput {
    @required
    cluster: ClusterInfoSummary
}
