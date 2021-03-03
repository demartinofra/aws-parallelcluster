namespace parallelcluster

@pattern("^[a-zA-Z][a-zA-Z0-9-]+$")
@length(min: 5, max: 60)
@documentation("Name of the image")
string ImageName

structure BuildImageInfo {
    @required
    @documentation("Name of the Image")
    imageName: String,
    @required
    @documentation("AWS region where the image is created")
    region: Region,
    @required
    @documentation("ParallelCluster version used to build the image")
    version: Version,
    @required
    @documentation("Status of the image build.")
    buildImageStatus: BuildImageStatus,
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
    buildImageConfiguration: BuildImageConfigurationData,
    @required
    @documentation("Tags of the infrastructure to build the Image")
    tags: Tags,
    @documentation("Status of the EC2ImageBuilder Image resource for the image build process.")
    ec2ImagebuilderImageStatus: EC2ImageBuilderImageStatus,
    @documentation("CloudWatch LogGroup containing the log stream of the EC2ImageBuilder Image resource for the image build process.")
    ec2ImagebuilderImageCWLogGroup: String,
    // EC2ImageBuilderImageArn or EC2ImageBuilderImageInfo structure
    @documentation("EC2 ami info")
    ec2AmiInfo: EC2AmiInfo,
    @documentation("The reason of the failure of the EC2ImageBuilder Image resource for the image build process.")
    ec2ImagebuilderImageFailureReason: String,
}

structure EC2AmiInfo {
    @required
    @documentation("EC2 AMI id")
    amiId: String,
    @required
    @documentation("EC2 AMI Tags")
    tags: Tags,
    @required
    @documentation("EC2 AMI name")
    name: String,
    @required
    @documentation("EC2 AMI architecture")
    architecture: String,
    @required
    @documentation("EC2 AMI state")
    state: EC2AmiState,
    @required
    @documentation("EC2 AMI description")
    description: String
}

structure BuildImageInfoSummary {
    @required
    @documentation("Name of the image")
    imageName: ImageName,
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
    buildImageStatus: BuildImageStatus,
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
blob BuildImageConfigurationData

@enum([
    {value: "BUILD_IN_PROGRESS"},
    {value: "BUILD_FAILED"},
    {value: "BUILD_COMPLETE"},
    {value: "DELETE_IN_PROGRESS"},
    {value: "DELETE_FAILED"},
    {value: "DELETE_COMPLETE"},
])
string BuildImageStatus

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
string EC2ImageBuilderImageStatus

@enum([
    {value: "pending"},
    {value: "available"},
    {value: "invalid"},
    {value: "deregistered"},
    {value: "transient"},
    {value: "failed"},
    {value: "error"},
])
string EC2AmiState
