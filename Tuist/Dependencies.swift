import ProjectDescription

let swiftPackageManagerDependencies = SwiftPackageManagerDependencies(
    [
        .remote(url: "https://github.com/dogo/SketchKit", requirement: .upToNextMajor(from: "2.0.0")),
        .remote(url: "https://github.com/onevcat/Kingfisher", requirement: .upToNextMajor(from: "5.15.8")),
        .remote(url: "https://github.com/Quick/Nimble", requirement: .upToNextMajor(from: "10.0.0")),
        .remote(url: "https://github.com/Quick/Quick", requirement: .upToNextMajor(from: "5.0.1")),
        .remote(url: "https://github.com/ashfurrow/Nimble-Snapshots", requirement: .upToNextMajor(from: "9.4.0"))
    ],
    targetSettings: [
        "Nimble-Snapshots": ["ENABLE_TESTING_SEARCH_PATHS": "YES"],
        "iOSSnapshotTestCase": ["ENABLE_TESTING_SEARCH_PATHS": "YES"]
    ]
)

let dependencies = Dependencies(
    swiftPackageManager: swiftPackageManagerDependencies,
    platforms: [.iOS]
)
