import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("wayairlineslogotipo")
                    .resizable().scaledToFit()
                NavigationLink(destination: FlightsView().navigationBarBackButtonHidden(true)) {
                    Text("Ver Voos")
                        .font(.headline)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
        }
    }
}

