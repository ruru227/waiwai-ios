import Foundation
public enum MainTab:String,CaseIterable,Identifiable,Sendable{case home="ホーム",discover="探す",calls="通話",letters="レター",myPage="マイページ";public var id:String{rawValue};public var icon:String{switch self{case .home:"house.fill";case .discover:"magnifyingglass";case .calls:"phone.fill";case .letters:"envelope.fill";case .myPage:"person.fill"}}}
