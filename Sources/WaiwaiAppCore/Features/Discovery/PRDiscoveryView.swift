import SwiftUI
public struct PRDiscoveryView:View {
 let comedian=Comedian.mock; public var onRoute:(AppRoute)->Void
 public init(onRoute:@escaping(AppRoute)->Void){self.onRoute=onRoute}
 public var body:some View { ZStack(alignment:.bottom){WaiwaiTheme.ink.ignoresSafeArea();VStack(alignment:.leading,spacing:10){HStack{Text("waiwai").font(.title2.bold());Spacer();Text("発掘中").font(.caption.bold()).padding(8).background(.white.opacity(0.14)).clipShape(Capsule())}.foregroundStyle(.white);Spacer();Text("今週の注目芸人").font(.caption.bold()).padding(8).background(WaiwaiTheme.yellow).clipShape(Capsule());Text(comedian.name).font(.system(size:28,weight:.bold)).foregroundStyle(.white);Text("\(comedian.agency) ・ コンビ ・ \(comedian.genre)").foregroundStyle(.white.opacity(0.85));WaiwaiOnlineBadge();Button{onRoute(.callType(comedian))}label:{Label("今すぐ10分話す",systemImage:"phone.fill")}.buttonStyle(WaiwaiPrimaryButtonStyle())}.padding(20).padding(.bottom,24)}}
}
