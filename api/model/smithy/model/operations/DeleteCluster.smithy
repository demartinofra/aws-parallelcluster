namespace parallelcluster

@http(method: "DELETE", uri: "/clusters/{clusterId}", code: 200)
@tags(["Cluster CRUD"])
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
    @required
    region: Region,

    @httpQuery("retainLogs")
    @documentation("Retain cluster logs on delete. Defaults to False.")
    retainLogs: Boolean,
}

structure DeleteClusterOutput {
    @required
    cluster: ClusterInfoSummary
}
