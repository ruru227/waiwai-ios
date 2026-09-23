import Foundation
public struct Comedian:Identifiable,Hashable,Sendable {
 public let id:UUID; public var name:String; public var agency:String; public var genre:String; public var careerYears:Int; public var funnyCount:Int; public var followers:Int; public var isOnline:Bool; public var isDuo:Bool
 public init(id:UUID=UUID(),name:String,agency:String,genre:String,careerYears:Int,funnyCount:Int,followers:Int,isOnline:Bool,isDuo:Bool){self.id=id;self.name=name;self.agency=agency;self.genre=genre;self.careerYears=careerYears;self.funnyCount=funnyCount;self.followers=followers;self.isOnline=isOnline;self.isDuo=isDuo}
 public static let mock=Comedian(name:"カベドンズ",agency:"吉本興業",genre:"漫才",careerYears:3,funnyCount:12482,followers:3281,isOnline:true,isDuo:true)
}
