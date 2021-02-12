namespace parallelcluster

@pattern("^[a-zA-Z][a-zA-Z0-9-]+$")
@length(min: 5, max: 60)
@documentation("Name of the image")
string ImageId

structure ImageInfo {
    @required
    @documentation("Name of the Image")
    imageId: String,
    @required
    @documentation("AWS region where the image is created")
    region: Region,
    @required
    @documentation("ParallelCluster version used to build the image")
    version: Version,
    @required
    @documentation("Status of the image build.")
    imageBuildStatus: ImageBuildStatus,
    @required
    @documentation("Status of the CloudFormation stack for the image build process.")
    cloudformationStackStatus: CloudFormationStatus,
    @required
    @documentation("ARN of the main CloudFormation stack")
    cloudformationStackArn: String,
    @required
    @documentation("Timestamp representing the image creation time")
    creationTime: String,
    @required
    @documentation("Configuration for the image build process")
    imageConfiguration: ImageConfigurationData,
    @required
    @documentation("Tags of the infrastructure to build the Image")
    tags: Tags,
    @documentation("Status of the ImageBuilder Image resource for the image build process.")
    imagebuilderImageStatus: ImageBuilderImageStatus,
    // ImageBuilderImageArn or ImageBuilderImageInfo structure
    @documentation("EC2 ami info")
    ec2AmiInfo: Ec2AmiInfo
}

structure Ec2AmiInfo {
    @required
    @documentation("EC2 AMI id")
    amiId: String,
    @required
    @documentation("EC2 AMI Tags")
    tags: Tags,
    @required
    @documentation("EC2 AMI name")
    amiName: String,
    @required
    @documentation("EC2 AMI architecture")
    architecture: String,
    @required
    @documentation("EC2 AMI state")
    state: Ec2AmiState
}

structure ImageInfoSummary {
    @required
    @documentation("Name of the image")
    imageId: ImageId,
    @required
    @documentation("AWS region where the image is built")
    region: Region,
    @required
    @documentation("ParallelCluster version used to build the image")
    version: Version,
    @required
    @documentation("ARN of the main CloudFormation stack")
    cloudformationStackArn: String,
    @required
    @documentation("Status of the image build.")
    imageBuildStatus: ImageBuildStatus,
    @required
    @documentation("Status of the CloudFormation stack for the image build process.")
    cloudformationStackStatus: CloudFormationStatus,
}

// structure ImageConfigurationStructure {
//     data: ImageConfigurationData,
//     version: String,
//     creationTime: String,
// }

@documentation("Image configuration as a YAML document")
blob ImageConfigurationData

@enum([
    {value: "BUILD_IN_PROGRESS"},
    {value: "BUILD_FAILED"},
    {value: "BUILD_COMPLETE"},
    {value: "DELETE_IN_PROGRESS"},
    {value: "DELETE_FAILED"},
    {value: "DELETE_COMPLETE"},
])
string ImageBuildStatus

@enum([
    {value: "PENDING"},
    {value: "CREATING"},
    {value: "BUILDING"},
    {value: "TESTING"},
    {value: "DISTRIBUTING"},
    {value: "INTEGRATING"},
    {value: "AVAILABLE"},
    {value: "CANCELLED"},
    {value: "FAILED"},
    {value: "DEPRECATED"},
    {value: "DELETED"},
])
string ImageBuilderImageStatus

@enum([
    {value: "pending"},
    {value: "available"},
    {value: "invalid"},
    {value: "deregistered"},
    {value: "transient"},
    {value: "failed"},
    {value: "error"},
])
string Ec2AmiState
