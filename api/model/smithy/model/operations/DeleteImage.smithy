namespace parallelcluster

@http(method: "DELETE", uri: "/images/custom/{imageId}", code: 202)
@tags(["Image CRUD"])
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
    @required
    region: Region,

    @httpHeader("x-parallelcluster-version")
    @documentation("Forces a specific ParallelCluster version to be used when handling this request.")
    forceVersion: Version,
}

structure DeleteImageOutput {
    @required
    image: ImageInfoSummary
}
