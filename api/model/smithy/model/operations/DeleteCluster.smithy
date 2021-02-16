namespace parallelcluster

@http(method: "DELETE", uri: "/v3/clusters/{clusterId}", code: 202)
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
    @idempotencyToken
    @httpQuery("clientToken")
    @documentation("Idempotency token that can be set by the client so that retries for the same request are idempotent")
    clientToken: String,

//     @httpHeader("x-parallelcluster-version")
//     @documentation("Forces a specific ParallelCluster version to be used when handling this request.")
//     forceVersion: Version,
}

structure DeleteClusterOutput {
    @required
    cluster: ClusterInfoSummary
}
