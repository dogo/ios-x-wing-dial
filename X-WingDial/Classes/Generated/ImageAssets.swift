// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let aSf01BWingDial = ImageAsset(name: "a-sf-01-b-wing_dial")
  internal static let aggressorAssaultFighterDial = ImageAsset(name: "aggressor-assault-fighter_dial")
  internal static let alphaClassStarWingDial = ImageAsset(name: "alpha-class-star-wing_dial")
  internal static let arc170StarfighterDial = ImageAsset(name: "arc-170-starfighter_dial")
  internal static let attackShuttleDial = ImageAsset(name: "attack-shuttle_dial")
  internal static let auzituckGunshipDial = ImageAsset(name: "auzituck-gunship_dial")
  internal static let belbullab22StarfighterDial = ImageAsset(name: "belbullab-22-starfighter_dial")
  internal static let btlA4YWingDial = ImageAsset(name: "btl-a4-y-wing_dial")
  internal static let btlBYWingFrontFace2PngResize = ImageAsset(name: "btl-b-y-wing-Front-Face-2.png-resize")
  internal static let btlBYWingDial = ImageAsset(name: "btl-b-y-wing_dial")
  internal static let btlS8KWingDial = ImageAsset(name: "btl-s8-k-wing_dial")
  internal static let customizedYt1300LightFreighterDial = ImageAsset(name: "customized-yt-1300-light-freighter_dial")
  internal static let delta7AetherspriteDial = ImageAsset(name: "delta-7-aethersprite_dial")
  internal static let dialBack = ImageAsset(name: "dial_back")
  internal static let dialSelector = ImageAsset(name: "dial_selector")
  internal static let eWingDial = ImageAsset(name: "e-wing_dial")
  internal static let empireDialBack = ImageAsset(name: "empire_dial_back")
  internal static let escapeCraftDial = ImageAsset(name: "escape-craft_dial")
  internal static let fangFighterDial = ImageAsset(name: "fang-fighter_dial")
  internal static let firesprayClassPatrolCraftDial = ImageAsset(name: "firespray-class-patrol-craft_dial")
  internal static let g1aStarfighterDial = ImageAsset(name: "g-1a-starfighter_dial")
  internal static let hwk290LightFreighterDial = ImageAsset(name: "hwk-290-light-freighter_dial")
  internal static let hyenaClassDroidBomberDial = ImageAsset(name: "hyena-class-droid-bomber_dial")
  internal static let icBattleDroidOff = ImageAsset(name: "ic_battle_droid_off")
  internal static let icBattleDroidOn = ImageAsset(name: "ic_battle_droid_on")
  internal static let icDialOff = ImageAsset(name: "ic_dial_off")
  internal static let icDialOn = ImageAsset(name: "ic_dial_on")
  internal static let jumpmaster5000Dial = ImageAsset(name: "jumpmaster-5000_dial")
  internal static let kihraxzFighterDial = ImageAsset(name: "kihraxz-fighter_dial")
  internal static let lambdaClassT4aShuttleDial = ImageAsset(name: "lambda-class-t-4a-shuttle_dial")
  internal static let lancerClassPursuitCraftDial = ImageAsset(name: "lancer-class-pursuit-craft_dial")
  internal static let m12LKimogilaFighter = ImageAsset(name: "m12-l-kimogila-fighter")
  internal static let m3AInterceptorDial = ImageAsset(name: "m3-a-interceptor_dial")
  internal static let modifiedTieLnFighterDial = ImageAsset(name: "modified-tie-ln-fighter_dial")
  internal static let modifiedYt1300LightFreighterDial = ImageAsset(name: "modified-yt-1300-light-freighter_dial")
  internal static let nabooRoyalN1StarfighterDial = ImageAsset(name: "naboo-royal-n-1-starfighter_dial")
  internal static let nantexClassStarfighterDial = ImageAsset(name: "nantex-class-starfighter_dial")
  internal static let quadrijetTransferSpacetugDial = ImageAsset(name: "quadrijet-transfer-spacetug_dial")
  internal static let rebelDialBack = ImageAsset(name: "rebel_dial_back")
  internal static let resistanceTransportPodDial = ImageAsset(name: "resistance-transport-pod_dial")
  internal static let resistanceTransportDial = ImageAsset(name: "resistance-transport_dial")
  internal static let rz1AWingDial = ImageAsset(name: "rz-1-a-wing_dial")
  internal static let rz2AWingDial = ImageAsset(name: "rz-2-a-wing_dial")
  internal static let scavengedYt1300Dial = ImageAsset(name: "scavenged-yt-1300_dial")
  internal static let scumDialBack = ImageAsset(name: "scum_dial_back")
  internal static let scurrgH6BomberDial = ImageAsset(name: "scurrg-h-6-bomber_dial")
  internal static let sheathipedeClassShuttleDial = ImageAsset(name: "sheathipede-class-shuttle_dial")
  internal static let sithInfiltratorDial = ImageAsset(name: "sith-infiltrator_dial")
  internal static let starviperClassAttackPlatformDial = ImageAsset(name: "starviper-class-attack-platform_dial")
  internal static let t65XWingDial = ImageAsset(name: "t-65-x-wing_dial")
  internal static let t70XWingDial = ImageAsset(name: "t-70-x-wing_dial")
  internal static let tieAdvancedV1Dial = ImageAsset(name: "tie-advanced-v1_dial")
  internal static let tieAdvancedX1Dial = ImageAsset(name: "tie-advanced-x1_dial")
  internal static let tieAgAggressorDial = ImageAsset(name: "tie-ag-aggressor_dial")
  internal static let tieCaPunisherDial = ImageAsset(name: "tie-ca-punisher_dial")
  internal static let tieDDefenderDial = ImageAsset(name: "tie-d-defender_dial")
  internal static let tieFoFighterDial = ImageAsset(name: "tie-fo-fighter_dial")
  internal static let tieInterceptorDial = ImageAsset(name: "tie-interceptor_dial")
  internal static let tieLnFighterDial = ImageAsset(name: "tie-ln-fighter_dial")
  internal static let tiePhPhantomDial = ImageAsset(name: "tie-ph-phantom_dial")
  internal static let tieReaperDial = ImageAsset(name: "tie-reaper_dial")
  internal static let tieSaBomberDial = ImageAsset(name: "tie-sa-bomber_dial")
  internal static let tieSfFighterDial = ImageAsset(name: "tie-sf-fighter_dial")
  internal static let tieSkStrikerDial = ImageAsset(name: "tie-sk-striker_dial")
  internal static let tieVnSilencerDial = ImageAsset(name: "tie-vn-silencer_dial")
  internal static let upsilonClassCommandShuttleDial = ImageAsset(name: "upsilon-class-command-shuttle_dial")
  internal static let ut60dUWingDial = ImageAsset(name: "ut-60d-u-wing_dial")
  internal static let v19TorrentStarfighterDial = ImageAsset(name: "v-19-torrent-starfighter_dial")
  internal static let vcx100LightFreighterDial = ImageAsset(name: "vcx-100-light-freighter_dial")
  internal static let vt49DecimatorDial = ImageAsset(name: "vt-49-decimator_dial")
  internal static let vultureClassDroidFighterDial = ImageAsset(name: "vulture-class-droid-fighter_dial")
  internal static let yt2400LightFreighterDial = ImageAsset(name: "yt-2400-light-freighter_dial")
  internal static let yv666LightFreighterDial = ImageAsset(name: "yv-666-light-freighter_dial")
  internal static let z95Af4HeadhunterDial = ImageAsset(name: "z-95-af4-headhunter_dial")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
