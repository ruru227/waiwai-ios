import SwiftUI
public struct LetterInboxView:View{
 public init(){}
 public var body:some View{ScrollView{VStack(alignment:.leading,spacing:18){Text("レター").font(.largeTitle.bold());Picker("",selection:.constant(0)){Text("送ったレター").tag(0);Text("返信").tag(1)}.pickerStyle(.segmented);ForEach(["カベドンズ","ニコイチ","しゃべるくん"],id:\.self){n in HStack{Circle().fill(WaiwaiTheme.surface).frame(width:60,height:60);VStack(alignment:.leading){Text(n).font(.headline);Text(n=="カベドンズ" ? "🔥 最高・返信が届いています":"👏 応援・送信済み").font(.caption).foregroundStyle(n=="カベドンズ" ? WaiwaiTheme.gift:WaiwaiTheme.muted)};Spacer()}.padding().background(.white).clipShape(RoundedRectangle(cornerRadius:16))}}.padding(20)}}
}
