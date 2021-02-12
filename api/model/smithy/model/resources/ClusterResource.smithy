namespace parallelcluster

resource Cluster {
    identifiers: { clusterId: ClusterId },
    create: CreateCluster,
    list: ListClusters,
    read: DescribeCluster,
    delete: DeleteCluster,
    update: UpdateCluster,
    operations: [
        DescribeDcvSessionManagerEndpoint,
    ],
}

resource ClusterInstances {
    identifiers: { clusterId: ClusterId },
    read: DescribeClusterInstances,
    delete: DeleteClusterInstances,
}

resource ClusterComputeFleetStatus {
    identifiers: { clusterId: ClusterId },
    read: DescribeComputeFleetStatus,
    update: UpdateComputeFleetStatus,
}
