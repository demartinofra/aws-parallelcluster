namespace parallelcluster

@http(method: "DELETE", uri: "/v3/images/custom/{imageId}", code: 202)
@tags(["Image Operations"])
@idempotent
@documentation("Initiate the deletion of an image.")
operation DeleteImage {
    input: DeleteImageInput,
    output: DeleteImageOutput,
    errors: [
      InternalServiceException,
      BadRequestException,
      NotFoundException,
      UnauthorizedClientError,
      LimitExceededException,
    ]
}

structure DeleteImageInput {
    @httpLabel
    @required
    imageId: ImageId,

    @httpQuery("region")
    region: Region,

//     @httpHeader("x-parallelcluster-version")
//     @documentation("Forces a specific ParallelCluster version to be used when handling this request.")
//     forceVersion: Version,
}

structure DeleteImageOutput {
    @required
    image: ImageInfoSummary
}
