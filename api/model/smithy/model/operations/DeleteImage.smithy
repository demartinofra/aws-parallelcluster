namespace parallelcluster

@http(method: "DELETE", uri: "/v3/images/custom/{imageName}", code: 202)
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
    imageName: ImageName,

    @httpQuery("region")
    region: Region,
    @idempotencyToken
    @httpQuery("clientToken")
    @documentation("Idempotency token that can be set by the client so that retries for the same request are idempotent")
    clientToken: String,

//     @httpHeader("x-parallelcluster-version")
//     @documentation("Forces a specific ParallelCluster version to be used when handling this request.")
//     forceVersion: Version,
}

structure DeleteImageOutput {
    @required
    image: BuildImageInfoSummary
}
