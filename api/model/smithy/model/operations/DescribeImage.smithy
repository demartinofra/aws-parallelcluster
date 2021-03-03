namespace parallelcluster

@readonly
@http(method: "GET", uri: "/v3/images/custom/{imageName}", code: 200)
@tags(["Image Operations"])
@documentation("Get detailed information about an existing image.")
operation DescribeImage {
    input: DescribeImageInput,
    output: BuildImageInfo,
    errors: [
        InternalServiceException,
        BadRequestException,
        NotFoundException,
        UnauthorizedClientError,
        LimitExceededException,
    ]
}

structure DescribeImageInput {
    @httpLabel
    @required
    imageName: ImageName,
    @httpQuery("region")
    region: Region,
//     @httpHeader("x-parallelcluster-version")
//     @documentation("Forces a specific ParallelCluster version to be used when handling this request.")
//     forceVersion: Version,
}
