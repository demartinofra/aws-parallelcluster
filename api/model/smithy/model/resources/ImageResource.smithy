namespace parallelcluster

resource OfficialImage {
    operations: [ListOfficialImages]
}

resource CustomImage {
    identifiers: { imageId: ImageId },
    create: BuildImage,
    list: ListImages,
    read: DescribeImage,
    delete: DeleteImage,
}

// resource ImageConfiguration {
//     identifiers: {
//         imageId: ImageId,
//     },
//     read: DescribeImageConfiguration,
// }
