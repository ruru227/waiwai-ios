import SwiftUI
public struct CallTypeView:View {
 public let comedian:Comedian;public var onRoute:(AppRoute)->Void
 public init(comedian:Comedian,onRoute:@escaping(AppRoute)->Void){self.comedian=comedian;self.onRoute=onRoute}
 public var body:some View{VStack(alignment:.leading,spacing:20){Text("通話方法を選択").font(.title2.bold());WaiwaiOnlineBadge();card("☎ 音声通話","10分　¥○○");card("▣ ビデオ通話","10分　¥○○");Button("今すぐ話す"){onRoute(.instantPayment(comedian))}.buttonStyle(WaiwaiPrimaryButtonStyle());Button("日時を予約する"){onRoute(.reservationCalendar(comedian))}.frame(maxWidth:.infinity,minHeight:48).background(WaiwaiTheme.surface).clipShape(RoundedRectangle(cornerRadius:15));Spacer()}.padding(20)}
 private func card(_ a:String,_ b:String)->some View{VStack(alignment:.leading){Text(a).font(.headline);Text(b).foregroundStyle(WaiwaiTheme.muted)}.frame(maxWidth:.infinity,alignment:.leading).padding(20).background(WaiwaiTheme.surface).clipShape(RoundedRectangle(cornerRadius:18))}
}
public struct InstantPaymentView:View {
 public let comedian:Comedian;public var onRoute:(AppRoute)->Void
 public init(comedian:Comedian,onRoute:@escaping(AppRoute)->Void){self.comedian=comedian;self.onRoute=onRoute}
 public var body:some View{VStack(alignment:.leading,spacing:18){Text("今すぐ話す").font(.title2.bold());WaiwaiOnlineBadge();Text("音声通話 10分").font(.headline);Text("合計　¥○○").font(.title3.bold());Button("決済して今すぐ呼び出す"){onRoute(.ringing(comedian))}.buttonStyle(WaiwaiPrimaryButtonStyle());Text("応答できなかった場合は自動返金します").font(.caption).foregroundStyle(WaiwaiTheme.muted);Spacer()}.padding(20)}
}
public struct RingingView:View {
 public let comedian:Comedian;public var onRoute:(AppRoute)->Void
 public init(comedian:Comedian,onRoute:@escaping(AppRoute)->Void){self.comedian=comedian;self.onRoute=onRoute}
 public var body:some View{VStack(spacing:24){Spacer();Circle().fill(.white.opacity(0.12)).frame(width:160,height:160);Text(comedian.name).font(.title.bold());Text("呼び出しています…").foregroundStyle(.white.opacity(0.7));Button("デモ：応答"){onRoute(.videoCall(comedian))}.buttonStyle(WaiwaiPrimaryButtonStyle());Spacer()}.padding(20).foregroundStyle(.white).background(WaiwaiTheme.ink.ignoresSafeArea())}
}
public struct VideoCallView:View {
 public let comedian:Comedian;public var onRoute:(AppRoute)->Void
 public init(comedian:Comedian,onRoute:@escaping(AppRoute)->Void){self.comedian=comedian;self.onRoute=onRoute}
 public var body:some View{VStack{HStack{VStack(alignment:.leading){Text(comedian.name).font(.headline);Text("接続良好 ●").font(.caption).foregroundStyle(.green)};Spacer();Text("06:42").font(.headline)}.padding();Rectangle().fill(.white.opacity(0.08));Button("😂 面白い！"){}.buttonStyle(WaiwaiPrimaryButtonStyle()).padding();Button("通話を終了"){onRoute(.callComplete(comedian))}.foregroundStyle(.red).padding(.bottom,24)}.foregroundStyle(.white).background(WaiwaiTheme.ink.ignoresSafeArea())}
}
