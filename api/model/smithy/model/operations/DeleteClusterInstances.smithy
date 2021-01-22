namespace parallelcluster

@http(method: "DELETE", uri: "/clusters/{clusterId}/instances", code: 202)
@tags(["Cluster Instances"])
@idempotent
@documentation("Initiate the forced termination of all cluster compute nodes")
operation DeleteClusterInstances {
    input: DeleteClusterInstancesInput,
    output: DeleteClusterInstancesOutput,
    errors: [
      InternalServiceException,
      BadRequestException,
      NotFoundException,
      UnauthorizedClientError,
      LimitExceededException,
    ]
}

structure DeleteClusterInstancesInput {
    @httpLabel
    @required
    clusterId: ClusterId,
    @httpQuery("region")
    @required
    region: Region,
    @httpQuery("force")
    @documentation("Force the deletion also when the cluster id is not found.")
    force: Boolean,
}

structure DeleteClusterInstancesOutput {
}
