import SwiftUI

public struct LetterInboxView: View {
    @State private var selectedSegment = 0

    public init() {}

    public var body: some View {
        ZStack {
            WaiwaiTheme.cream.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    HStack {
                        Text("レターを送る")
                            .font(.system(size: 28, weight: .black, design: .rounded))
                            .foregroundStyle(WaiwaiTheme.brown)
                        Spacer()
                        Image(systemName: "questionmark.circle")
                            .foregroundStyle(WaiwaiTheme.brown)
                    }

                    Picker("", selection: $selectedSegment) {
                        Text("レター").tag(0)
                        Text("ギフト").tag(1)
                    }
                    .pickerStyle(.segmented)

                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .fill(WaiwaiTheme.softGradient)
                        .frame(height: 156)
                        .overlay {
                            HStack(spacing: 18) {
                                Image(systemName: "envelope.fill")
                                    .font(.system(size: 54))
                                    .foregroundStyle(.white)
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("応援の気持ちが")
                                    Text("きっと届く")
                                    Text("がんばる人の力に")
                                }
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                .foregroundStyle(.white)
                            }
                        }

                    Text("レターテンプレート")
                        .font(.headline)
                        .foregroundStyle(WaiwaiTheme.brown)

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        template("いつも\n笑わせてくれて\nありがとう！", "face.smiling")
                        template("これからも\n応援しています！", "megaphone.fill")
                        template("またお話し\nできるのを\n楽しみにしてます！", "heart.fill")
                        template("ずっと\n応援しています！", "sparkles")
                    }

                    Button {
                    } label: {
                        Label("レターを書く", systemImage: "pencil")
                    }
                    .buttonStyle(WaiwaiPrimaryButtonStyle())

                    Spacer(minLength: 80)
                }
                .padding(.horizontal, 18)
                .padding(.top, 8)
            }
        }
    }

    private func template(_ text: String, _ icon: String) -> some View {
        WaiwaiSoftCard {
            VStack(spacing: 12) {
                Text(text)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundStyle(WaiwaiTheme.brown)
                    .multilineTextAlignment(.center)
                Image(systemName: icon)
                    .foregroundStyle(WaiwaiTheme.coral)
                    .font(.title2)
            }
            .frame(maxWidth: .infinity, minHeight: 118)
        }
    }
}
