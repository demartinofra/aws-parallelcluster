namespace parallelcluster

resource OfficialImage {
    operations: [DescribeOfficialImages]
}

resource CustomImage {
    identifiers: { imageName: ImageName },
    create: BuildImage,
    list: DescribeImages,
    read: DescribeImage,
    delete: DeleteImage,
}
