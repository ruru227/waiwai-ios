import SwiftUI
public struct CallCompleteView:View {
 public let comedian:Comedian;public var onRoute:(AppRoute)->Void
 public init(comedian:Comedian,onRoute:@escaping(AppRoute)->Void){self.comedian=comedian;self.onRoute=onRoute}
 public var body:some View{VStack(spacing:22){Spacer();Text("😂").font(.system(size:64));Text("通話ありがとうございました！").font(.title2.bold());Button("😂 面白かった！"){}.buttonStyle(WaiwaiPrimaryButtonStyle());Button("💌 レターギフトを送る"){onRoute(.letterGift(comedian))}.foregroundStyle(WaiwaiTheme.gift);Spacer()}.padding(20)}
}
public struct ReservationCompleteView:View {
 public let comedian:Comedian;public init(comedian:Comedian){self.comedian=comedian}
 public var body:some View{VStack(spacing:22){Spacer();Text("✓").font(.system(size:54,weight:.bold)).frame(width:100,height:100).background(WaiwaiTheme.yellow).clipShape(Circle());Text("予約が完了しました").font(.title2.bold());Text("\(comedian.name)との10分通話");Spacer()}.padding(20)}
}
public struct LetterGiftView:View {
 public let comedian:Comedian;public init(comedian:Comedian){self.comedian=comedian}
 public var body:some View{VStack(alignment:.leading,spacing:18){Text("レターギフト").font(.title2.bold());Text("\(comedian.name)へ応援を届ける");ForEach(["👏 応援　300円","😂 爆笑　500円","🔥 最高　1,000円","⭐ 全力応援　3,000円"],id:\.self){Text($0).frame(maxWidth:.infinity,alignment:.leading).padding().background(WaiwaiTheme.surface).clipShape(RoundedRectangle(cornerRadius:16))};Button("レターギフトを送る"){}.frame(maxWidth:.infinity,minHeight:54).background(WaiwaiTheme.gift).foregroundStyle(.white).clipShape(RoundedRectangle(cornerRadius:17));Spacer()}.padding(20)}
}
