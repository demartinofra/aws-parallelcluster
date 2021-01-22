namespace parallelcluster

resource OfficialImage {
    operations: [ListOfficialImages]
}

resource CustomImage {
    identifiers: { imageId: ImageId },
    create: BuildImage,
//     list: ListClusters,
//     read: DescribeCluster,
//     delete: DeleteCluster,
//     update: UpdateCluster,
}
