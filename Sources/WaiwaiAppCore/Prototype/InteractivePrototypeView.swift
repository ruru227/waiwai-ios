import SwiftUI
public struct InteractivePrototypeView:View{
 @State private var path:[PrototypeRoute]=[]
 public init(){}
 public var body:some View{
  NavigationStack(path:$path){
   PrototypeHomeView(go:{path.append($0)})
    .navigationDestination(for:PrototypeRoute.self){route in destination(route)}
  }
 }
 @ViewBuilder private func destination(_ r:PrototypeRoute)->some View{
  let c=Comedian.mock
  switch r{
  case .comedianProfile:ComedianProfileView(comedian:c){route in bridge(route)}
  case .callType:CallTypeView(comedian:c){route in bridge(route)}
  case .instantPayment:InstantPaymentView(comedian:c){route in bridge(route)}
  case .ringing:RingingView(comedian:c){route in bridge(route)}
  case .videoCall:VideoCallView(comedian:c){route in bridge(route)}
  case .callComplete:CallCompleteView(comedian:c){route in bridge(route)}
  case .reservationCalendar:ReservationCalendarView(comedian:c){route in bridge(route)}
  case .payment:PaymentConfirmView(comedian:c){route in bridge(route)}
  case .reservationComplete:ReservationCompleteView(comedian:c)
  case .letterGift:LetterGiftView(comedian:c)
  case .busy:InstantCallBusyView()
  case .timeout:InstantCallTimeoutView()
  case .duo:DuoAvailabilityView()
  case .following:FollowingView()
  case .callHistory:CallHistoryView()
  case .notifications:NotificationsView()
  case .settings:SettingsView()
  case .notificationSettings:NotificationSettingsView()
  case .inquiry:InquiryView()
  case .report:ReportBlockView()
  case .connectionError:ConnectionErrorView()
  case .comedianDashboard:ComedianDashboardView()
  case .comedianProfileEdit:ComedianProfileEditView()
  case .comedianVideos:ComedianVideoManagementView()
  case .comedianAvailability:ComedianAvailabilityView()
  case .comedianReservations:ComedianReservationsView()
  case .comedianLetterReply:ComedianLetterReplyView()
  case .comedianEarnings:ComedianEarningsView()
  case .comedianIncoming:ComedianIncomingCallView()
  }
 }
 private func bridge(_ r:AppRoute){
  switch r{
  case .comedianProfile:path.append(.comedianProfile)
  case .callType:path.append(.callType)
  case .instantPayment:path.append(.instantPayment)
  case .ringing:path.append(.ringing)
  case .videoCall:path.append(.videoCall)
  case .callComplete:path.append(.callComplete)
  case .reservationCalendar:path.append(.reservationCalendar)
  case .payment:path.append(.payment)
  case .reservationComplete:path.append(.reservationComplete)
  case .letterGift:path.append(.letterGift)
  }
 }
}
public struct PrototypeHomeView:View{
 public var go:(PrototypeRoute)->Void
 public init(go:@escaping(PrototypeRoute)->Void){self.go=go}
 public var body:some View{
  ScrollView{VStack(alignment:.leading,spacing:20){
   Text("waiwai").font(.largeTitle.bold())
   Text("Interactive Prototype").font(.headline).foregroundStyle(WaiwaiTheme.muted)
   Text("主要ユーザーフロー").font(.title3.bold())
   Button("PR → 芸人プロフィール"){go(.comedianProfile)}.buttonStyle(WaiwaiPrimaryButtonStyle())
   Button("今すぐ通話フロー"){go(.callType)}.buttonStyle(WaiwaiPrimaryButtonStyle())
   Button("予約通話フロー"){go(.reservationCalendar)}.buttonStyle(WaiwaiPrimaryButtonStyle())
   Button("レターギフト"){go(.letterGift)}.buttonStyle(WaiwaiPrimaryButtonStyle())
   Text("状態確認").font(.title3.bold())
   row("芸人が通話中"){go(.busy)};row("応答なし・自動返金"){go(.timeout)};row("コンビ即時通話"){go(.duo)};row("通信エラー"){go(.connectionError)}
   Text("ファン画面").font(.title3.bold())
   row("フォロー中"){go(.following)};row("通話履歴"){go(.callHistory)};row("お知らせ"){go(.notifications)};row("設定"){go(.settings)};row("お問い合わせ"){go(.inquiry)};row("通報・ブロック"){go(.report)}
   Text("芸人側").font(.title3.bold())
   row("芸人ホーム"){go(.comedianDashboard)};row("プロフィール編集"){go(.comedianProfileEdit)};row("PR・投稿管理"){go(.comedianVideos)};row("予約枠設定"){go(.comedianAvailability)};row("予約一覧"){go(.comedianReservations)};row("レター返信"){go(.comedianLetterReply)};row("売上"){go(.comedianEarnings)};row("着信"){go(.comedianIncoming)}
  }.padding(20)}
 }
 private func row(_ title:String,action:@escaping()->Void)->some View{Button(action:action){HStack{Text(title);Spacer();Image(systemName:"chevron.right")}.foregroundStyle(WaiwaiTheme.ink).padding().background(WaiwaiTheme.surface).clipShape(RoundedRectangle(cornerRadius:14))}}
}
