import SwiftUI

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
            Sheets()
                .tabItem{
                    Label("Sheets", systemImage: "doc.text")
                }
//            Calendar()
//                .tabItem{
//                    Label("Sheets", systemImage: "")
//                }
        }
    }
}

//Testing new Branch
#Preview {
    ContentView()
}
