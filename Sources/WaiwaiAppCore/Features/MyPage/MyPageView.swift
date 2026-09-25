import SwiftUI

public struct MyPageView: View {
    public init() {}

    public var body: some View {
        List {
            Section {
                HStack {
                    Circle()
                        .fill(WaiwaiTheme.surface)
                        .frame(width: 72, height: 72)
                    VStack(alignment: .leading) {
                        Text("こんぺ").font(.title3.bold())
                        Text("プロフィールを編集")
                            .font(.caption)
                            .foregroundStyle(WaiwaiTheme.muted)
                    }
                }
            }

            Section("アクティビティ") {
                NavigationLink("フォロー中の芸人") { FollowingView() }
                NavigationLink("予約・通話履歴") { CallHistoryView() }
                NavigationLink("レター履歴") { LetterInboxView() }
                NavigationLink("お知らせ") { NotificationsView() }
            }

            Section("サポート・設定") {
                NavigationLink("設定") { SettingsView() }
                NavigationLink("お問い合わせ") { InquiryView() }
            }
        }
        .navigationTitle("マイページ")
    }
}
