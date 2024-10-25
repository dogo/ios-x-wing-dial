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
        .package(url: "https://github.com/Quick/Nimble", from: "13.6.0"),
        .package(url: "https://github.com/Quick/Quick", from: "7.6.2"),
        .package(url: "https://github.com/ashfurrow/Nimble-Snapshots", from: "9.8.0"),
    ]
)
