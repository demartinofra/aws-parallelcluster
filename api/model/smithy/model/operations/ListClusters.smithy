namespace parallelcluster

@paginated
@readonly
@http(method: "GET", uri: "/clusters", code: 200)
@tags(["Cluster CRUD"])
@documentation("Retrieve the list of existing clusters managed by the API.")
operation ListClusters {
    input: ListClustersInput,
    output: ListClustersOutput,
    errors: [
        InternalServiceException,
        BadRequestException,
        UnauthorizedClientError,
        LimitExceededException,
    ]
}

structure ListClustersInput {
    @httpQuery("region")
    @documentation("List clusters deployed to a given AWS Region")
    @required
    region: Region,
    @httpQuery("nextToken")
    nextToken: String,
    @httpQuery("showDeleted")
    @documentation("List deleted clusters.")
    showDeleted: Boolean,
    @httpHeader("x-parallelcluster-version")
    @documentation("Forces a specific ParallelCluster version to be used when handling this request.")
    forceVersion: Version,
}

structure ListClustersOutput {
    nextToken: String,

    @required
    items: ClusterSummaries,
}

list ClusterSummaries {
    member: ClusterInfoSummary
}
