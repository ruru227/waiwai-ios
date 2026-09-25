import SwiftUI

public enum WaiwaiTheme {
    public static let cream = Color(red: 1.00, green: 0.98, blue: 0.95)
    public static let card = Color.white
    public static let brown = Color(red: 0.28, green: 0.15, blue: 0.10)
    public static let muted = Color(red: 0.49, green: 0.42, blue: 0.39)
    public static let yellow = Color(red: 1.00, green: 0.78, blue: 0.30)
    public static let peach = Color(red: 1.00, green: 0.64, blue: 0.43)
    public static let coral = Color(red: 1.00, green: 0.38, blue: 0.49)
    public static let blush = Color(red: 1.00, green: 0.92, blue: 0.91)
    public static let surface = Color(red: 0.98, green: 0.96, blue: 0.94)
    public static let online = Color(red: 0.20, green: 0.70, blue: 0.38)
    public static let gift = coral
    public static let ink = brown

    public static let warmGradient = LinearGradient(
        colors: [yellow, peach, coral],
        startPoint: .leading,
        endPoint: .trailing
    )

    public static let softGradient = LinearGradient(
        colors: [Color(red: 1.0, green: 0.91, blue: 0.63), Color(red: 1.0, green: 0.77, blue: 0.78)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

public struct WaiwaiPrimaryButtonStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 15, weight: .bold))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, minHeight: 54)
            .background(WaiwaiTheme.warmGradient.opacity(configuration.isPressed ? 0.78 : 1))
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            .shadow(color: WaiwaiTheme.coral.opacity(0.16), radius: 10, y: 5)
    }
}

public struct WaiwaiOnlineBadge: View {
    public init() {}

    public var body: some View {
        Label("今すぐ話せる", systemImage: "circle.fill")
            .font(.caption.weight(.bold))
            .foregroundStyle(WaiwaiTheme.online)
    }
}

public struct WaiwaiSoftCard<Content: View>: View {
    private let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        content
            .padding(16)
            .background(WaiwaiTheme.card)
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
            .shadow(color: .black.opacity(0.05), radius: 14, y: 6)
    }
}

public struct WaiwaiChip: View {
    let title: String
    let selected: Bool

    public init(_ title: String, selected: Bool = false) {
        self.title = title
        self.selected = selected
    }

    public var body: some View {
        Text(title)
            .font(.caption.weight(.semibold))
            .foregroundStyle(selected ? .white : WaiwaiTheme.brown)
            .padding(.horizontal, 14)
            .padding(.vertical, 9)
            .background(selected ? AnyShapeStyle(WaiwaiTheme.warmGradient) : AnyShapeStyle(Color.white))
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black.opacity(selected ? 0 : 0.05)))
    }
}
