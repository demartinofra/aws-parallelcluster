namespace parallelcluster

resource OfficialImage {
    operations: [DescribeOfficialImages]
}

resource CustomImage {
    identifiers: { imageId: ImageId },
    create: BuildImage,
    list: DescribeImages,
    read: DescribeImage,
    delete: DeleteImage,
}
