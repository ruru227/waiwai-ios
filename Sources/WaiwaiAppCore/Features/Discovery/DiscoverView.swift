import SwiftUI
public struct DiscoverView:View{
 let items=[Comedian.mock,Comedian(name:"ニコイチ",agency:"吉本興業",genre:"コント",careerYears:2,funnyCount:8201,followers:1902,isOnline:true,isDuo:true),Comedian(name:"しゃべるくん",agency:"ワタナベ",genre:"トーク",careerYears:1,funnyCount:5112,followers:880,isOnline:false,isDuo:false)]
 public init(){}
 public var body:some View{ScrollView{VStack(alignment:.leading,spacing:18){Text("芸人を探す").font(.largeTitle.bold());TextField("芸人名・コンビ名で検索",text:.constant("")).textFieldStyle(.roundedBorder);Text("🔥 今週の急上昇").font(.title3.bold());ForEach(items){c in NavigationLink(value:c){HStack(spacing:14){Circle().fill(WaiwaiTheme.surface).frame(width:72,height:72);VStack(alignment:.leading){Text(c.name).font(.headline).foregroundStyle(WaiwaiTheme.ink);Text(c.isOnline ? "● 今すぐ話せる":"\(c.genre)・芸歴\(c.careerYears)年").font(.caption).foregroundStyle(c.isOnline ? WaiwaiTheme.online:WaiwaiTheme.muted)};Spacer()}.padding().background(.white).clipShape(RoundedRectangle(cornerRadius:16))}}}.padding(20)}.navigationDestination(for:Comedian.self){c in ComedianProfileView(comedian:c){_ in}}}
}
