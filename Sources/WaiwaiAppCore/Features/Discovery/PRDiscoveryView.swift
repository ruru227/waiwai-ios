import SwiftUI

public struct PRDiscoveryView: View {
    private let comedian = Comedian.mock
    public var onRoute: (AppRoute) -> Void

    public init(onRoute: @escaping (AppRoute) -> Void) {
        self.onRoute = onRoute
    }

    public var body: some View {
        ZStack {
            WaiwaiTheme.cream.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 16) {
                    header
                    categoryRow
                    featuredCard
                    secondaryCard
                    Spacer(minLength: 80)
                }
                .padding(.horizontal, 18)
                .padding(.top, 8)
            }
        }
    }

    private var header: some View {
        HStack {
            HStack(spacing: 8) {
                Image(systemName: "sparkles")
                    .foregroundStyle(WaiwaiTheme.coral)
                Text("waiwai")
                    .font(.system(size: 24, weight: .black, design: .rounded))
                    .foregroundStyle(WaiwaiTheme.brown)
            }

            Spacer()

            ZStack(alignment: .topTrailing) {
                Image(systemName: "bell")
                    .font(.title3)
                    .foregroundStyle(WaiwaiTheme.brown)
                Circle()
                    .fill(WaiwaiTheme.coral)
                    .frame(width: 8, height: 8)
                    .offset(x: 2, y: -2)
            }
        }
    }

    private var categoryRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                WaiwaiChip("おすすめ", selected: true)
                WaiwaiChip("人気")
                WaiwaiChip("新着")
                WaiwaiChip("フォロー中")
            }
        }
    }

    private var featuredCard: some View {
        WaiwaiSoftCard {
            VStack(alignment: .leading, spacing: 12) {
                ZStack(alignment: .bottomLeading) {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [Color(red: 0.94, green: 0.79, blue: 0.64), Color(red: 0.70, green: 0.47, blue: 0.31)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(height: 280)
                        .overlay {
                            VStack(spacing: 12) {
                                Image(systemName: "play.circle.fill")
                                    .font(.system(size: 62))
                                    .foregroundStyle(.white.opacity(0.92))
                                Text("PR VIDEO")
                                    .font(.caption.bold())
                                    .foregroundStyle(.white.opacity(0.75))
                            }
                        }

                    Text("笑える時間を\nいっしょに！")
                        .font(.system(size: 19, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .padding(18)
                }

                HStack(spacing: 12) {
                    Circle()
                        .fill(WaiwaiTheme.softGradient)
                        .frame(width: 46, height: 46)
                        .overlay(Image(systemName: "face.smiling.fill").foregroundStyle(.white))

                    VStack(alignment: .leading, spacing: 2) {
                        Text("たかしのトークタイム")
                            .font(.headline)
                            .foregroundStyle(WaiwaiTheme.brown)
                        Text("たかし")
                            .font(.caption)
                            .foregroundStyle(WaiwaiTheme.muted)
                    }

                    Spacer()
                }

                Text("日常のあれこれでゆるっとトーク！みなさんのお話も聞かせてください〜！")
                    .font(.subheadline)
                    .foregroundStyle(WaiwaiTheme.muted)

                HStack {
                    Label("面白い！ 1,234", systemImage: "heart.fill")
                        .font(.subheadline.weight(.bold))
                        .foregroundStyle(WaiwaiTheme.coral)

                    Spacer()

                    Button("今すぐ話す") {
                        onRoute(.callType(comedian))
                    }
                    .font(.subheadline.bold())
                    .foregroundStyle(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 13)
                    .background(WaiwaiTheme.warmGradient)
                    .clipShape(Capsule())
                }
            }
        }
    }

    private var secondaryCard: some View {
        WaiwaiSoftCard {
            VStack(alignment: .leading, spacing: 10) {
                RoundedRectangle(cornerRadius: 18)
                    .fill(WaiwaiTheme.softGradient)
                    .frame(height: 180)
                    .overlay {
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 54))
                            .foregroundStyle(.white)
                    }

                Text("みんなで楽しく話そう！")
                    .font(.headline)
                    .foregroundStyle(WaiwaiTheme.brown)
                Text("新しい芸人を見つけて、気軽に話してみよう。")
                    .font(.caption)
                    .foregroundStyle(WaiwaiTheme.muted)
            }
        }
    }
}
