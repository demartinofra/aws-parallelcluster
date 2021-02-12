namespace parallelcluster

@http(method: "DELETE", uri: "/clusters/{clusterId}", code: 202)
@tags(["Cluster Operations"])
@idempotent
@documentation("Initiate the deletion of a cluster.")
operation DeleteCluster {
    input: DeleteClusterInput,
    output: DeleteClusterOutput,
    errors: [
      InternalServiceException,
      BadRequestException,
      NotFoundException,
      UnauthorizedClientError,
      LimitExceededException,
    ]
}

structure DeleteClusterInput {
    @httpLabel
    @required
    clusterId: ClusterId,

    @httpQuery("region")
    region: Region,

    @httpQuery("retainLogs")
    @documentation("Retain cluster logs on delete. Defaults to True.")
    retainLogs: Boolean,

//     @httpHeader("x-parallelcluster-version")
//     @documentation("Forces a specific ParallelCluster version to be used when handling this request.")
//     forceVersion: Version,
}

structure DeleteClusterOutput {
    @required
    cluster: ClusterInfoSummary
}
