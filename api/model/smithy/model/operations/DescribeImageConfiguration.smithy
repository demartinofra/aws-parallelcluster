namespace parallelcluster

@readonly
@http(method: "GET", uri: "/images/custom/{imageId}/configuration", code: 200)
@tags(["Image Configuration"])
@documentation("Retrieve an image configuration .")
operation DescribeImageConfiguration {
    input: DescribeImageConfigurationInput,
    output: DescribeImageConfigurationOutput,
    errors: [
        InternalServiceException,
        BadRequestException,
        NotFoundException,
        UnauthorizedClientError,
        LimitExceededException,
    ]
}

structure DescribeImageConfigurationInput {
    @httpLabel
    @required
    imageId: ImageId,
    @httpQuery("region")
    region: Region,
//     @httpHeader("x-parallelcluster-version")
//     @documentation("Forces a specific ParallelCluster version to be used when handling this request.")
//     forceVersion: Version,
}

structure DescribeImageConfigurationOutput {
    @required
    imageConfiguration: ImageConfigurationData,
}
