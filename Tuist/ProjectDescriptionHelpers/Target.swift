import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

public extension Project {

    static func targets() -> [Target] {
        return [
            Target(
                name: "X-WingDial",
                platform: .iOS,
                product: .app,
                bundleId: "br.com.anykey.X-WingDial",
                deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone, .ipad], supportsMacDesignedForIOS: false),
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
            Target(
                name: "X-WingDialTests",
                platform: .iOS,
                product: .unitTests,
                bundleId: "br.com.anykey.X-WingDialTests",
                deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone, .ipad], supportsMacDesignedForIOS: false),
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
