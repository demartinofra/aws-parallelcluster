namespace parallelcluster

@pattern("^[a-zA-Z][a-zA-Z0-9-]+$")
@length(min: 5, max: 60)
@documentation("Name of the image")
string ImageId

structure ImageInfo {
    @required
    @documentation("Name of the cluster")
    clusterId: String,
    @required
    @documentation("AWS region where the cluster is created")
    region: Region,
    @required
    @documentation("ParallelCluster version used to create the cluster")
    version: Version,
    @required
    @documentation("Status of the cluster. This corresponds to the CloudFormation stack status.")
    CloudFormationStatus: CloudFormationStatus,
    @required
    @documentation("ARN of the main CloudFormation stack")
    cloudformationStackArn: String,
    @required
    @documentation("Timestamp representing the cluster creation time")
    creationTime: String,
    @required
    @documentation("Timestamp representing the last cluster update time")
    lastUpdatedTime: String,
    @required
    clusterConfiguration: ClusterConfigurationStructure,
    @required
    computeFleetStatus: ComputeFleetStatus,
    headnode: EC2Instance,
}

structure ImageInfoSummary {
    @required
    @documentation("Name of the cluster")
    imageId: ImageId,
    @required
    @documentation("AWS region where the image is created")
    region: Region,
    @required
    @documentation("ParallelCluster version used to create the image")
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

structure ClusterConfigurationStructure {
    data: ClusterConfigurationData,
    version: String,
    creationTime: String,
}

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
