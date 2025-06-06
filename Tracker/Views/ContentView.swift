import SwiftUI


struct ContentView: View {
    var body: some View {
        
        TabView{

            ProductStockView()
                .tabItem{
                    Label("Stock", systemImage: "shippingbox")
                }

    }
}

//Testing new Branch
#Preview {
    ContentView()
}
