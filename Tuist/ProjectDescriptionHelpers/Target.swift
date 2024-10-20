import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

public extension Project {

    private static let deploymentTarget: DeploymentTargets = .iOS("13.0")

    static func targets() -> [Target] {
        return [
            .target(
                name: "X-WingDial",
                destinations: [.iPhone, .iPad],
                product: .app,
                bundleId: "br.com.anykey.X-WingDial",
                deploymentTargets: deploymentTarget,
                infoPlist: "X-WingDial/Info.plist",
                sources: ["X-WingDial/Classes/**"],
                resources: [
                    "X-WingDial/Resources/Assets.xcassets",
                    "X-WingDial/Resources/xwing-symbols.ttf",
                    "X-WingDial/Base.lproj/**",
                    "X-WingDial/Localization/**"
                ],
                scripts: Project.targetScripts(),
                dependencies: [
                    .external(name: "Kingfisher"),
                    .external(name: "SketchKit")
                ]
            ),
            .target(
                name: "X-WingDialTests",
                destinations: [.iPhone, .iPad],
                product: .unitTests,
                bundleId: "br.com.anykey.X-WingDialTests",
                deploymentTargets: deploymentTarget,
                infoPlist: "X-WingDialTests/Info.plist",
                sources: ["X-WingDialTests/**"],
                resources: [
                    "X-WingDialTests/Json/*.json"
                ],
                dependencies: [
                    .target(name: "X-WingDial"),
                    .external(name: "Quick"),
                    .external(name: "Nimble"),
                    .external(name: "Nimble-Snapshots")
                ]
            )
        ]
    }
}
