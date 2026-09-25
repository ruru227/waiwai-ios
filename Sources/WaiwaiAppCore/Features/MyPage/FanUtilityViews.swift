import SwiftUI

public struct FollowingView: View {
    public init() {}
    public var body: some View {
        List(["カベドンズ", "ニコイチ", "しゃべるくん"], id: \.self) { name in
            Label(name, systemImage: "person.crop.circle")
        }
        .navigationTitle("フォロー中")
    }
}

public struct CallHistoryView: View {
    public init() {}
    public var body: some View {
        List {
            row("カベドンズ", "9/21 17:10", "完了")
            row("ニコイチ", "9/18 20:30", "完了")
            row("しゃべるくん", "9/25 20:00", "予約中")
        }
        .navigationTitle("通話履歴")
    }

    private func row(_ name: String, _ date: String, _ status: String) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(name).font(.headline)
                Spacer()
                Text(status)
                    .font(.caption)
                    .foregroundStyle(status == "予約中" ? WaiwaiTheme.online : WaiwaiTheme.muted)
            }
            Text(date).font(.caption).foregroundStyle(WaiwaiTheme.muted)
        }
    }
}

public struct NotificationsView: View {
    public init() {}
    public var body: some View {
        List {
            Text("カベドンズが今すぐ通話を開始しました")
            Text("カベドンズから返信が届きました")
            Text("明日は予約した通話の日です")
        }
        .navigationTitle("お知らせ")
    }
}

public struct SettingsView: View {
    public init() {}
    public var body: some View {
        List {
            NavigationLink("通知設定") { NotificationSettingsView() }
            Text("アカウント")
            Text("ブロックしたユーザー")
            Text("ヘルプ・よくある質問")
            NavigationLink("お問い合わせ") { InquiryView() }
            Text("利用規約")
            Text("プライバシーポリシー")
            Text("ログアウト").foregroundStyle(.red)
        }
        .navigationTitle("設定")
    }
}

public struct NotificationSettingsView: View {
    @State private var pr = true
    @State private var instant = true
    @State private var reminder = true

    public init() {}

    public var body: some View {
        Form {
            Section("フォロー中の芸人") {
                Toggle("新しいPR動画", isOn: $pr)
                Toggle("今すぐ通話受付", isOn: $instant)
            }
            Section("通話・予約") {
                Toggle("開始前リマインド", isOn: $reminder)
            }
        }
        .navigationTitle("通知設定")
    }
}

public struct InquiryView: View {
    @State private var text = ""
    public init() {}

    public var body: some View {
        Form {
            Picker("カテゴリ", selection: .constant(0)) {
                Text("通話・返金について").tag(0)
                Text("その他").tag(1)
            }
            TextEditor(text: $text).frame(height: 180)
            Button("送信する") {}
                .buttonStyle(WaiwaiPrimaryButtonStyle())
        }
        .navigationTitle("お問い合わせ")
    }
}
