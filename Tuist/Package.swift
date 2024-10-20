// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription
    import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        targetSettings: [
            "Nimble-Snapshots": ["ENABLE_TESTING_SEARCH_PATHS": "YES"],
            "iOSSnapshotTestCase": ["ENABLE_TESTING_SEARCH_PATHS": "YES"]
        ]
    )
#endif

let package = Package(
    name: "PackageName",
    dependencies: [
        .package(url: "https://github.com/dogo/SketchKit", from: "2.1.0"),
        .package(url: "https://github.com/onevcat/Kingfisher", exact: "5.15.8"),
        .package(url: "https://github.com/Quick/Nimble", exact: "12.2.0"),
        .package(url: "https://github.com/Quick/Quick", exact: "7.2.0"),
        .package(url: "https://github.com/ashfurrow/Nimble-Snapshots", revision: "9e4ab0a00b3d0f1d6d2d358e5886532f87503d10")
    ]
)
