import SwiftUI
public struct ComedianProfileView:View {
 public let comedian:Comedian; public var onRoute:(AppRoute)->Void
 public init(comedian:Comedian,onRoute:@escaping(AppRoute)->Void){self.comedian=comedian;self.onRoute=onRoute}
 public var body:some View { ScrollView{VStack(alignment:.leading,spacing:18){Rectangle().fill(WaiwaiTheme.ink).frame(height:260);Text(comedian.name).font(.largeTitle.bold());Text("\(comedian.agency) ・ \(comedian.genre) ・ 芸歴\(comedian.careerYears)年").foregroundStyle(WaiwaiTheme.muted);HStack{Text("😂 \(comedian.funnyCount)");Text("♡ \(comedian.followers)")}.font(.subheadline.bold());if comedian.isOnline{WaiwaiOnlineBadge()};Button("📞 音声で話す　10分 ¥○○"){onRoute(.callType(comedian))}.buttonStyle(WaiwaiPrimaryButtonStyle());Button("日時を予約する"){onRoute(.reservationCalendar(comedian))}.frame(maxWidth:.infinity,minHeight:48).background(WaiwaiTheme.surface).clipShape(RoundedRectangle(cornerRadius:15));Button("💌 レターギフトを送る"){onRoute(.letterGift(comedian))}.foregroundStyle(WaiwaiTheme.gift)}.padding(20)}}
}
