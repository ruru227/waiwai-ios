import SwiftUI
public struct WaiwaiPrototypeAppView:View{@State private var authenticated=false;public init(){};public var body:some View{if authenticated{WaiwaiMainTabView()}else{LoginView{authenticated=true}}}}
