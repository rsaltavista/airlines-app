import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("wayairlineslogotipo")
                    .resizable().scaledToFit()
                
                Button(action: {
                    navigateToFlightsView()
                }) {
                    Text("Ver Histórico de Voos")
                        .font(.headline)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.black)
                        .opacity(1)
                        .cornerRadius(10)
                }
            }
        }
    }
    
    func navigateToFlightsView() {
        let flightService = FlightService()
        let flightViewModel = FlightViewModel(flightService: flightService)
        let flightsVC = FlightsViewController(viewModel: flightViewModel)
        
        // Define o título da NavigationBar
        flightsVC.title = "Flights"
        
        // Recupera o UINavigationController atual
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           
           let window = windowScene.windows.first,

           let navigationController = window.rootViewController as? UINavigationController {
            // Faz o push da nova tela (voos) no stack de navegação
            navigationController.pushViewController(flightsVC, animated: true)
        }
    }
}
