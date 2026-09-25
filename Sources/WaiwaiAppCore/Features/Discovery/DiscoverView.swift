import SwiftUI

public struct DiscoverView: View {
    private let items = [
        Comedian.mock,
        Comedian(name: "あやか", agency: "吉本興業", genre: "コント", careerYears: 2, funnyCount: 8201, followers: 1902, isOnline: true, isDuo: false),
        Comedian(name: "カラフル", agency: "松竹芸能", genre: "漫才", careerYears: 4, funnyCount: 6211, followers: 1442, isOnline: true, isDuo: true),
        Comedian(name: "ケンジ", agency: "ワタナベ", genre: "トーク", careerYears: 1, funnyCount: 5112, followers: 880, isOnline: false, isDuo: false)
    ]

    @State private var query = ""

    public init() {}

    public var body: some View {
        ZStack {
            WaiwaiTheme.cream.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("芸人を探す")
                            .font(.system(size: 28, weight: .black, design: .rounded))
                            .foregroundStyle(WaiwaiTheme.brown)
                        Spacer()
                        Image(systemName: "gearshape")
                            .foregroundStyle(WaiwaiTheme.brown)
                    }

                    searchBar

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 9) {
                            WaiwaiChip("すべて", selected: true)
                            WaiwaiChip("漫才")
                            WaiwaiChip("コント")
                            WaiwaiChip("ピン芸人")
                            WaiwaiChip("トーク")
                            WaiwaiChip("癒し")
                            WaiwaiChip("関西")
                            WaiwaiChip("女性")
                            WaiwaiChip("新人")
                        }
                    }

                    VStack(spacing: 12) {
                        ForEach(items) { comedian in
                            comedianRow(comedian)
                        }
                    }

                    Spacer(minLength: 80)
                }
                .padding(.horizontal, 18)
                .padding(.top, 8)
            }
        }
        .navigationDestination(for: Comedian.self) { comedian in
            ComedianProfileView(comedian: comedian) { _ in }
        }
    }

    private var searchBar: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(WaiwaiTheme.muted)
            TextField("芸人名・キーワードで検索", text: $query)
                .textInputAutocapitalization(.never)
        }
        .padding(.horizontal, 14)
        .frame(height: 46)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private func comedianRow(_ comedian: Comedian) -> some View {
        NavigationLink(value: comedian) {
            WaiwaiSoftCard {
                HStack(spacing: 14) {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(WaiwaiTheme.softGradient)
                        .frame(width: 92, height: 92)
                        .overlay(
                            Image(systemName: comedian.isDuo ? "person.2.fill" : "person.fill")
                                .font(.title2)
                                .foregroundStyle(.white)
                        )

                    VStack(alignment: .leading, spacing: 6) {
                        Text(comedian.name)
                            .font(.headline)
                            .foregroundStyle(WaiwaiTheme.brown)

                        Text(comedian.genre == "漫才" ? "楽しい時間をお届けします！" : "一緒に笑って元気になりましょう")
                            .font(.caption)
                            .foregroundStyle(WaiwaiTheme.muted)
                            .lineLimit(2)

                        HStack(spacing: 6) {
                            WaiwaiChip(comedian.genre)
                            if comedian.isOnline {
                                Text("● 受付中")
                                    .font(.caption2.bold())
                                    .foregroundStyle(WaiwaiTheme.online)
                            }
                        }
                    }

                    Spacer()

                    Image(systemName: "heart")
                        .foregroundStyle(WaiwaiTheme.muted)
                }
            }
        }
        .buttonStyle(.plain)
    }
}
