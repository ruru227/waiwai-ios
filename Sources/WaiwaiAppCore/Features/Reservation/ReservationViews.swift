import SwiftUI
public struct ReservationCalendarView:View {
 public let comedian:Comedian;public var onRoute:(AppRoute)->Void;@State private var day=21;@State private var time="17:10"
 public init(comedian:Comedian,onRoute:@escaping(AppRoute)->Void){self.comedian=comedian;self.onRoute=onRoute}
 public var body:some View{ScrollView{VStack(alignment:.leading,spacing:18){Text("日時を予約する").font(.title2.bold());Text("2026年9月").font(.title3.bold());LazyVGrid(columns:Array(repeating:GridItem(.flexible()),count:7)){ForEach(["日","月","火","水","木","金","土"],id:\.self){Text($0).font(.caption.bold()).foregroundStyle(WaiwaiTheme.muted)};ForEach(1...30,id:\.self){d in Button("\(d)"){day=d}.frame(width:36,height:36).background(d==day ? WaiwaiTheme.yellow:.clear).clipShape(Circle())}};Text("空いている時間").font(.headline);LazyVGrid(columns:Array(repeating:GridItem(.flexible()),count:4)){ForEach(["17:00","17:10","17:20","17:30","18:00","18:10","18:20","18:30"],id:\.self){t in Button(t){time=t}.font(.caption.bold()).padding(.vertical,10).frame(maxWidth:.infinity).background(t==time ? WaiwaiTheme.yellow:WaiwaiTheme.surface).clipShape(RoundedRectangle(cornerRadius:12))}};Button("9月\(day)日 \(time)で予約する"){onRoute(.payment(comedian))}.buttonStyle(WaiwaiPrimaryButtonStyle())}.padding(20)}}
}
public struct PaymentConfirmView:View {
 public let comedian:Comedian;public var onRoute:(AppRoute)->Void
 public init(comedian:Comedian,onRoute:@escaping(AppRoute)->Void){self.comedian=comedian;self.onRoute=onRoute}
 public var body:some View{VStack(alignment:.leading,spacing:18){Text("決済内容の確認").font(.title2.bold());Text(comedian.name).font(.headline);Text("ビデオ通話 10分");Text("料金　¥○○").font(.title3.bold());Button("決済して予約を確定"){onRoute(.reservationComplete(comedian))}.buttonStyle(WaiwaiPrimaryButtonStyle());Spacer()}.padding(20)}
}
