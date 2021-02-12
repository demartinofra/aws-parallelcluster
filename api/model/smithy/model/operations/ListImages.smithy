namespace parallelcluster

@paginated
@readonly
@http(method: "GET", uri: "/v3/images/custom", code: 200)
@tags(["Image Operations"])
@documentation("Retrieve the list of existing custom images managed by the API. Deleted images are not showed by default")
operation ListImages {
    input: ListImagesInput,
    output: ListImagesOutput,
    errors: [
        InternalServiceException,
        BadRequestException,
        UnauthorizedClientError,
        LimitExceededException,
    ]
}

structure ListImagesInput {
    @httpQuery("region")
    @documentation("List Images built into a given AWS Region. Defaults to the AWS region the API is deployed to.")
    region: Region,
    @httpQuery("nextToken")
    nextToken: String,
    @httpQuery("imageStatusFilter")
    @documentation("Filter by image status.")
    imageStatusFilter: ImageStatusFilteringOptions,
//     @httpHeader("x-parallelcluster-version")
//     @documentation("Forces a specific ParallelCluster version to be used when handling this request.")
//     forceVersion: Version,
}

structure ListImagesOutput {
    nextToken: String,

    @required
    items: ImageInfoSummaries,
}

list ImageInfoSummaries {
    member: ImageInfoSummary
}

set ImageStatusFilteringOptions {
    member: ImageBuildStatus
}
