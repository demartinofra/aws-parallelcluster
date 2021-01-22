namespace parallelcluster

@http(method: "POST", uri: "/images/custom", code: 202)
@tags(["Image CRUD"])
@documentation("Create a custom ParallelCluster image in a given region.")
operation BuildImage {
    input: BuildImageInput,
    output: BuildImageOutput,
    errors: [
      InternalServiceException,
      BuildImageBadRequestException,
      ConflictException,
      UnauthorizedClientError,
      LimitExceededException,
    ]
}

structure BuildImageInput {
    @httpQuery("version")
    @documentation("ParallelCluster version to use when creating the image. This option will only be available in case the API has support for multiple ParallelCluster versions")
    version: Version,
    @httpQuery("suppressValidators")
    @documentation("Identifies one or more config validators to suppress. Format: ALL|id:$value|level:(info|error|warning)|type:$value")
    suppressValidators: SuppressValidatorsList,
    @httpQuery("validationFailureLevel")
    @documentation("Min validation level that will cause the creation to fail. Defaults to 'error'.")
    validationFailureLevel: ValidationLevel,
    @httpQuery("dryrun")
    @documentation("Only perform request validation without creating any resource. It can be used to validate the image configuration. Response code: 200")
    dryrun: Boolean,
    @httpQuery("rollbackOnFailure")
    @documentation("When set it automatically initiates an image stack rollback on failures. Defaults to true.")
    rollbackOnFailure: Boolean,

    @required
    name: ImageId,
    @required
    region: Region,
    @required
    imageConfiguration: ImageConfigurationData,
}

structure BuildImageOutput {
    @required
    image: ImageInfoSummary,
    @required
    @documentation("List of messages collected during image config validation whose level is lower than the validationFailureLevel set by the user")
    validationMessages: ValidationMessages
}

list SuppressValidatorsList {
   member: SuppressValidatorExpression
}

string SuppressValidatorExpression
