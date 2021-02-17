namespace parallelcluster

@readonly
@http(method: "GET", uri: "/v3/images/official", code: 200)
@tags(["Image Operations"])
@documentation("Describe ParallelCluster AMIs.")
@paginated
operation DescribeOfficialImages {
    input: DescribeOfficialImagesInput,
    output: DescribeOfficialImagesOutput,
    errors: [
        InternalServiceException,
        BadRequestException,
        UnauthorizedClientError,
        LimitExceededException,
    ]
}

structure DescribeOfficialImagesInput {
    @httpQuery("version")
    @documentation("ParallelCluster version to retrieve AMIs for.")
    version: Version,
    @httpQuery("region")
    region: Region,
    @httpQuery("os")
    @documentation("Filter by OS distribution")
    os: String,
    @httpQuery("architecture")
    @documentation("Filter by architecture")
    architecture: String,
    @httpQuery("nextToken")
    nextToken: String,
//     @httpHeader("x-parallelcluster-version")
//     @documentation("Forces a specific ParallelCluster version to be used when handling this request.")
//     forceVersion: Version,
}

structure DescribeOfficialImagesOutput {
    nextToken: String,

    @required
    items: AmisInfo,
}

list AmisInfo {
    member: AmiInfo
}

structure AmiInfo {
    @required
    architecture: String,
    @required
    amiId: String,
    @required
    name: String,
    @required
    os: String,
}
