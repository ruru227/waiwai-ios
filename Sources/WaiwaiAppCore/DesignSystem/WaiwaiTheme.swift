import SwiftUI
public enum WaiwaiTheme {
 public static let yellow=Color(red:1,green:0.85,blue:0)
 public static let ink=Color(red:0.055,green:0.055,blue:0.06)
 public static let surface=Color(red:0.965,green:0.965,blue:0.975)
 public static let muted=Color(red:0.42,green:0.42,blue:0.46)
 public static let online=Color(red:0.08,green:0.68,blue:0.35)
 public static let gift=Color(red:1,green:0.28,blue:0.48)
}
public struct WaiwaiPrimaryButtonStyle:ButtonStyle {
 public init(){}
 public func makeBody(configuration:Configuration)->some View { configuration.label.font(.system(size:15,weight:.bold)).foregroundStyle(WaiwaiTheme.ink).frame(maxWidth:.infinity,minHeight:54).background(WaiwaiTheme.yellow.opacity(configuration.isPressed ? 0.75:1)).clipShape(RoundedRectangle(cornerRadius:17)) }
}
public struct WaiwaiOnlineBadge:View {
 public init(){}
 public var body:some View { Label("今すぐ話せる",systemImage:"circle.fill").font(.caption.weight(.bold)).foregroundStyle(WaiwaiTheme.online) }
}
