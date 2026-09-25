import Foundation

public enum MainTab: String, CaseIterable, Identifiable, Sendable {
    case home = "PR"
    case discover = "芸人"
    case calls = "予約"
    case letters = "レター"
    case myPage = "マイページ"

    public var id: String { rawValue }

    public var icon: String {
        switch self {
        case .home: "house.fill"
        case .discover: "magnifyingglass"
        case .calls: "calendar"
        case .letters: "envelope.fill"
        case .myPage: "person.fill"
        }
    }
}
