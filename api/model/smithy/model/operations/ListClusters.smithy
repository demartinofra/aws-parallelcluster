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
    @documentation("List clusters deployed to a given AWS Region. Defaults to the AWS region the API is deployed to.")
    region: Region,
    @httpQuery("nextToken")
    nextToken: String,
    @httpQuery("filterByStatus")
    @documentation("Filter by cluster status. Initially only used to show deleted clusters.")
    filterByStatus: ClusterStatusFilteringOptions,
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

@enum([
    {name: "DELETE_COMPLETE", value: "DELETE_COMPLETE"},
])
string ClusterStatusFilteringOptions
