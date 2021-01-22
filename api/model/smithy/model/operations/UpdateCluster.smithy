namespace parallelcluster

@http(method: "PATCH", uri: "/clusters/{clusterId}", code: 202)
@tags(["Cluster CRUD"])
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
    @required
    region: Region,
    @httpQuery("dryrun")
    @documentation("Only perform request validation without creating any resource. It can be used to validate the cluster configuration and update requirements. Response code: 200")
    dryrun: Boolean,

    @required
    clusterConfiguration: ClusterConfigurationData,
}

structure UpdateClusterOutput {
    @required
    clusterInfo: ClusterInfoSummary
}
