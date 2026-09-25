import SwiftUI

public struct CallsHubView: View {
    @State private var selectedSegment = 0

    public init() {}

    public var body: some View {
        ZStack {
            WaiwaiTheme.cream.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Text("予約・スケジュール")
                        .font(.system(size: 28, weight: .black, design: .rounded))
                        .foregroundStyle(WaiwaiTheme.brown)

                    Picker("", selection: $selectedSegment) {
                        Text("今後の予定").tag(0)
                        Text("過去の履歴").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .tint(WaiwaiTheme.coral)

                    Text("次の通話予約")
                        .font(.headline)
                        .foregroundStyle(WaiwaiTheme.brown)

                    appointment(name: "たかし", date: "4月12日（土）", time: "20:00 - 20:15")
                    appointment(name: "あやか", date: "4月18日（金）", time: "21:00 - 21:15")

                    Button {
                    } label: {
                        Label("新しく予約する", systemImage: "calendar.badge.plus")
                    }
                    .buttonStyle(WaiwaiPrimaryButtonStyle())

                    Text("たのしい時間を\n楽しみにしています！")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundStyle(WaiwaiTheme.muted)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 20)

                    Spacer(minLength: 80)
                }
                .padding(.horizontal, 18)
                .padding(.top, 8)
            }
        }
    }

    private func appointment(name: String, date: String, time: String) -> some View {
        WaiwaiSoftCard {
            VStack(spacing: 14) {
                HStack(spacing: 14) {
                    Circle()
                        .fill(WaiwaiTheme.softGradient)
                        .frame(width: 68, height: 68)
                        .overlay(Image(systemName: "person.fill").foregroundStyle(.white))

                    VStack(alignment: .leading, spacing: 5) {
                        Text(date)
                            .font(.headline)
                            .foregroundStyle(WaiwaiTheme.brown)
                        Text(time)
                            .font(.title3.weight(.semibold))
                            .foregroundStyle(WaiwaiTheme.brown)
                        Text(name)
                            .font(.caption)
                            .foregroundStyle(WaiwaiTheme.muted)
                    }

                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(WaiwaiTheme.coral)
                }

                HStack {
                    Button("詳細を見る") {}
                        .font(.caption.bold())
                        .foregroundStyle(WaiwaiTheme.brown)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 10)
                        .background(WaiwaiTheme.surface)
                        .clipShape(Capsule())

                    Spacer()

                    Button("キャンセル") {}
                        .font(.caption.bold())
                        .foregroundStyle(.white)
                        .padding(.horizontal, 22)
                        .padding(.vertical, 10)
                        .background(WaiwaiTheme.coral)
                        .clipShape(Capsule())
                }
            }
        }
    }
}
