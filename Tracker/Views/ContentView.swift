import SwiftUI

//Adicionei tabview

struct ContentView: View {
    var body: some View {
        TabView{
            BarCharts()
                .tabItem{
                    Label("Dashboard", systemImage: "chart.xyaxis.line")
                }
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

//Testing new Branch
#Preview {
    ContentView()
}
