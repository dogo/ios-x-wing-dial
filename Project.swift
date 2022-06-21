import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let options = Project.Options.options(
    disableBundleAccessors: true
)

let project = Project(
    name: "X-WingDial",
    organizationName: "Diogo Autilio",
    options: options,
    settings: Project.settings(),
    targets: Project.targets(),
    resourceSynthesizers: []
)
