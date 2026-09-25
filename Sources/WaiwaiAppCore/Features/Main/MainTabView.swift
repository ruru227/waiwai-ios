import SwiftUI

public struct WaiwaiMainTabView: View {
    @State private var selected: MainTab = .home

    public init() {}

    public var body: some View {
        TabView(selection: $selected) {
            WaiwaiRootView()
                .tabItem { Label(MainTab.home.rawValue, systemImage: MainTab.home.icon) }
                .tag(MainTab.home)

            NavigationStack {
                DiscoverView()
            }
            .tabItem { Label(MainTab.discover.rawValue, systemImage: MainTab.discover.icon) }
            .tag(MainTab.discover)

            NavigationStack {
                CallsHubView()
            }
            .tabItem { Label(MainTab.calls.rawValue, systemImage: MainTab.calls.icon) }
            .tag(MainTab.calls)

            NavigationStack {
                LetterInboxView()
            }
            .tabItem { Label(MainTab.letters.rawValue, systemImage: MainTab.letters.icon) }
            .tag(MainTab.letters)

            NavigationStack {
                MyPageView()
            }
            .tabItem { Label(MainTab.myPage.rawValue, systemImage: MainTab.myPage.icon) }
            .tag(MainTab.myPage)
        }
        .tint(WaiwaiTheme.coral)
        .toolbarBackground(WaiwaiTheme.cream.opacity(0.98), for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
    }
}
