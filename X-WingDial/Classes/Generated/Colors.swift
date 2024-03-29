// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit.NSColor
  internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  internal typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
internal struct ColorPalette {
  internal let rgbaValue: UInt32
  internal var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#442025"></span>
  /// Alpha: 100% <br/> (0x442025ff)
  internal static let appQuaternary = ColorPalette(rgbaValue: 0x442025ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#754d52"></span>
  /// Alpha: 100% <br/> (0x754d52ff)
  internal static let appQuinary = ColorPalette(rgbaValue: 0x754d52ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#a7aabd"></span>
  /// Alpha: 100% <br/> (0xa7aabdff)
  internal static let appSeconday = ColorPalette(rgbaValue: 0xa7aabdff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#737687"></span>
  /// Alpha: 100% <br/> (0x737687ff)
  internal static let appTertiary = ColorPalette(rgbaValue: 0x737687ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#202a44"></span>
  /// Alpha: 100% <br/> (0x202a44ff)
  internal static let appTheme = ColorPalette(rgbaValue: 0x202a44ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
  /// Alpha: 100% <br/> (0xffffffff)
  internal static let text = ColorPalette(rgbaValue: 0xffffffff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#202a44"></span>
  /// Alpha: 100% <br/> (0x202a44ff)
  internal static let textSection = ColorPalette(rgbaValue: 0x202a44ff)
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let components = RGBAComponents(rgbaValue: rgbaValue).normalized
    self.init(red: components[0], green: components[1], blue: components[2], alpha: components[3])
  }
}

private struct RGBAComponents {
  let rgbaValue: UInt32

  private var shifts: [UInt32] {
    [
      rgbaValue >> 24, // red
      rgbaValue >> 16, // green
      rgbaValue >> 8,  // blue
      rgbaValue        // alpha
    ]
  }

  private var components: [CGFloat] {
    shifts.map { CGFloat($0 & 0xff) }
  }

  var normalized: [CGFloat] {
    components.map { $0 / 255.0 }
  }
}

internal extension Color {
  convenience init(named color: ColorPalette) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
