import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model:Model
    var body: some View {
        VStack {
            LittleLemonLogo()
                .padding(.top, 50)
            
            Text(model.displayingReservationForm ? "Reservation Details" : "Select a location")
                    .padding([.leading, .trailing], 40)
                    .padding([.top, .bottom], 8)
                    .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
            
            
            NavigationView {
                
                List {
                    ForEach(model.restaurants,id: \.self){resturant in
                        
                        NavigationLink(destination: ReservationForm(resturant)) {
                            RestaurantView(resturant)                        }
                    
                } }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
            }
        }
        .padding(.top, -10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}

