namespace parallelcluster

@pattern("^[a-zA-Z][a-zA-Z0-9-]+$")
@length(min: 5, max: 60)
@documentation("Name of the cluster")
string ClusterId

structure ClusterInfo {
    @required
    @documentation("Name of the cluster")
    clusterId: ClusterId,
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

structure ClusterInfoSummary {
    @required
    @documentation("Name of the cluster")
    clusterId: ClusterId,
    @required
    @documentation("AWS region where the cluster is created")
    region: Region,
    @required
    @documentation("ParallelCluster version used to create the cluster")
    version: Version,
    @required
    @documentation("ARN of the main CloudFormation stack")
    cloudformationStackArn: String,
    @required
    @documentation("Status of the CloudFormation stack provisioning the cluster infrastructure.")
    cloudformationStackStatus: CloudFormationStatus,
    @required
    @documentation("Status of the cluster infrastructure")
    clusterStatus: ClusterStatus,
}

@enum([
    {value: "CREATE_IN_PROGRESS"},
    {value: "CREATE_FAILED"},
    {value: "CREATE_COMPLETE"},
    {value: "UPDATE_IN_PROGRESS"},
    {value: "UPDATE_FAILED"},
    {value: "UPDATE_COMPLETE"},
    {value: "DELETE_IN_PROGRESS"},
    {value: "DELETE_FAILED"},
    {value: "DELETE_COMPLETE"},
])
string ClusterStatus

@enum([
    {value: "START_REQUESTED"},
    {value: "STARTING"},
    {value: "RUNNING"},
    {value: "STOP_REQUESTED"},
    {value: "STOPPING"},
    {value: "STOPPED"},
    {value: "ENABLED"},  // works only with AWS Batch
    {value: "DISABLED"},  // works only with AWS Batch
])
string ComputeFleetStatus

structure ClusterConfigurationStructure {
    data: ClusterConfigurationData,
    version: String,
    creationTime: String,
}

list ClusterConfigurationSummaries {
    member: ClusterConfigurationSummary
}

structure ClusterConfigurationSummary {
    version: String,
    creationTime: String,
}

@documentation("Cluster configuration as a YAML document")
blob ClusterConfigurationData
