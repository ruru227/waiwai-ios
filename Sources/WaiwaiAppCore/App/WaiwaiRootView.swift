import SwiftUI
public struct WaiwaiRootView:View {
 @State private var path:[AppRoute]=[];public init(){}
 public var body:some View{NavigationStack(path:$path){PRDiscoveryView{path.append($0)}.navigationDestination(for:AppRoute.self){r in destination(r)}}}
 @ViewBuilder private func destination(_ r:AppRoute)->some View{switch r{
 case .comedianProfile(let c):ComedianProfileView(comedian:c){path.append($0)}
 case .callType(let c):CallTypeView(comedian:c){path.append($0)}
 case .instantPayment(let c):InstantPaymentView(comedian:c){path.append($0)}
 case .ringing(let c):RingingView(comedian:c){path.append($0)}
 case .videoCall(let c):VideoCallView(comedian:c){path.append($0)}
 case .callComplete(let c):CallCompleteView(comedian:c){path.append($0)}
 case .reservationCalendar(let c):ReservationCalendarView(comedian:c){path.append($0)}
 case .payment(let c):PaymentConfirmView(comedian:c){path.append($0)}
 case .reservationComplete(let c):ReservationCompleteView(comedian:c)
 case .letterGift(let c):LetterGiftView(comedian:c)
 }}
}
