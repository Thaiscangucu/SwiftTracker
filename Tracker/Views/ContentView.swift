import SwiftUI

//Adicionei tabview 

struct ContentView: View {
    var body: some View {
        TabView{
//            Dashboard()
//                .tabItem{
//                    Label("Dashboard", systemImage: "chart.xyaxis.line")
//                }
            ProductStockView()
                .tabItem{
                    Label("Stock", systemImage: "shippingbox")
                }
//            Sheets()
//                .tabItem{
//                    Label("Sheets", systemImage: "doc.text")
//                }
        }

    }
}

#Preview {
    ContentView()
}
