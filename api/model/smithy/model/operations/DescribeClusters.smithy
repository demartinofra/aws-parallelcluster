namespace parallelcluster

@paginated
@readonly
@http(method: "GET", uri: "/v3/clusters", code: 200)
@tags(["Cluster Operations"])
@documentation("Retrieve the list of existing clusters managed by the API. Deleted clusters are not listed by default.")
operation DescribeClusters {
    input: DescribeClustersInput,
    output: DescribeClustersOutput,
    errors: [
        InternalServiceException,
        BadRequestException,
        UnauthorizedClientError,
        LimitExceededException,
    ]
}

structure DescribeClustersInput {
    @httpQuery("region")
    @documentation("List clusters deployed to a given AWS Region. Defaults to the AWS region the API is deployed to.")
    region: Region,
    @httpQuery("nextToken")
    nextToken: String,
    @httpQuery("clusterStatusFilter")
    @documentation("Filter by cluster status.")
    clusterStatusFilter: ClusterStatusFilteringOptions,
//     @httpHeader("x-parallelcluster-version")
//     @documentation("Forces a specific ParallelCluster version to be used when handling this request.")
//     forceVersion: Version,
}

structure DescribeClustersOutput {
    nextToken: String,

    @required
    items: ClusterSummaries,
}

list ClusterSummaries {
    member: ClusterInfoSummary
}

set ClusterStatusFilteringOptions {
    member: ClusterStatus
}
