namespace parallelcluster

@paginated
@readonly
@http(method: "GET", uri: "/images/custom", code: 200)
@tags(["Image CRUD"])
@documentation("Retrieve the list of existing custom images managed by the API.")
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
    @httpQuery("filterByStatus")
    @documentation("Filter by image status. Initially only used to show deleted images.")
    filterByStatus: ImageStatusFilteringOptions,
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

@enum([
    {name: "DELETE_COMPLETE", value: "DELETE_COMPLETE"},
])
string ImageStatusFilteringOptions
