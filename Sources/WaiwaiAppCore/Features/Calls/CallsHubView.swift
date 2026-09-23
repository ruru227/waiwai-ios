import SwiftUI
public struct CallsHubView:View{
 public init(){}
 public var body:some View{ScrollView{VStack(alignment:.leading,spacing:18){Text("通話").font(.largeTitle.bold());Text("今すぐ話せる芸人").font(.title3.bold());HStack{ForEach(0..<3,id:\.self){i in VStack{Circle().fill(WaiwaiTheme.surface).frame(width:82,height:82);Text(i==0 ? "カベドンズ":"芸人\(i+1)").font(.caption.bold());Text("● 受付中").font(.caption2).foregroundStyle(WaiwaiTheme.online)}};};Text("次の予約").font(.title3.bold());VStack(alignment:.leading,spacing:8){Text("カベドンズ").font(.headline);Text("9月25日 20:00");Text("ビデオ通話・10分").foregroundStyle(WaiwaiTheme.muted)}.padding().frame(maxWidth:.infinity,alignment:.leading).background(WaiwaiTheme.surface).clipShape(RoundedRectangle(cornerRadius:18))}.padding(20)}}
}
