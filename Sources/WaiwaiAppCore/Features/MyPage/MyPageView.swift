import SwiftUI

public struct MyPageView: View {
    public init() {}

    public var body: some View {
        ZStack {
            WaiwaiTheme.cream.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    HStack {
                        Text("マイページ")
                            .font(.system(size: 28, weight: .black, design: .rounded))
                            .foregroundStyle(WaiwaiTheme.brown)
                        Spacer()
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gearshape")
                                .font(.title3)
                                .foregroundStyle(WaiwaiTheme.brown)
                        }
                    }

                    HStack(spacing: 14) {
                        Circle()
                            .fill(WaiwaiTheme.softGradient)
                            .frame(width: 76, height: 76)
                            .overlay(Image(systemName: "person.fill").font(.title).foregroundStyle(.white))

                        VStack(alignment: .leading, spacing: 5) {
                            Text("はる")
                                .font(.title3.bold())
                                .foregroundStyle(WaiwaiTheme.brown)
                            Text("笑いのある毎日がすきです 🌸")
                                .font(.caption)
                                .foregroundStyle(WaiwaiTheme.muted)

                            Button("プロフィールを編集") {}
                                .font(.caption.bold())
                                .foregroundStyle(WaiwaiTheme.brown)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background(Color.white)
                                .clipShape(Capsule())
                        }
                    }

                    stats

                    menuCard

                    Spacer(minLength: 80)
                }
                .padding(.horizontal, 18)
                .padding(.top, 8)
            }
        }
    }

    private var stats: some View {
        WaiwaiSoftCard {
            HStack {
                stat("12", "予約した通話")
                Divider()
                stat("28", "送ったレター")
                Divider()
                stat("5", "お気に入り")
            }
            .frame(height: 66)
        }
    }

    private func stat(_ value: String, _ label: String) -> some View {
        VStack(spacing: 5) {
            Text(value)
                .font(.title3.bold())
                .foregroundStyle(WaiwaiTheme.brown)
            Text(label)
                .font(.caption2)
                .foregroundStyle(WaiwaiTheme.muted)
        }
        .frame(maxWidth: .infinity)
    }

    private var menuCard: some View {
        WaiwaiSoftCard {
            VStack(spacing: 0) {
                NavigationLink { NotificationsView() } label: { row("お知らせ", "bell") }
                Divider()
                NavigationLink { CallHistoryView() } label: { row("予約履歴", "calendar") }
                Divider()
                NavigationLink { LetterInboxView() } label: { row("送ったレター", "envelope") }
                Divider()
                NavigationLink { FollowingView() } label: { row("お気に入りの芸人", "heart") }
                Divider()
                NavigationLink { SettingsView() } label: { row("アカウント設定", "gearshape") }
                Divider()
                NavigationLink { InquiryView() } label: { row("ヘルプ・お問い合わせ", "questionmark.circle") }
                Divider()
                row("利用規約", "doc.text")
                Divider()
                row("プライバシーポリシー", "lock")
                Divider()
                row("ログアウト", "rectangle.portrait.and.arrow.right")
            }
        }
    }

    private func row(_ title: String, _ icon: String) -> some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 24)
                .foregroundStyle(WaiwaiTheme.brown)
            Text(title)
                .font(.subheadline)
                .foregroundStyle(WaiwaiTheme.brown)
            Spacer()
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(WaiwaiTheme.muted)
        }
        .padding(.vertical, 13)
    }
}
