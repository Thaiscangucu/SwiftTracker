import SwiftUI

//Adicionei tabview

struct ContentView: View {
    var body: some View {
        TabView{
            ProductBarCharts()
                .tabItem{
                    Label("Dashboard", systemImage: "chart.xyaxis.line")
                }
                .toolbarBackground(.navy, for: .tabBar)
                            .toolbarBackground(.visible, for: .tabBar)
            ProductStockView()
                .tabItem{
                    Label("Stock", systemImage: "shippingbox")
                }
                .toolbarBackground(.navy, for: .tabBar)
                            .toolbarBackground(.visible, for: .tabBar)
            CalendarView()
                .tabItem{
                    Label("Calendar", systemImage: "calendar")
                }
                .toolbarBackground(.navy, for: .tabBar)
                            .toolbarBackground(.visible, for: .tabBar)
            Sheets()
                .tabItem{
                    Label("Sheets", systemImage: "doc.text")
                }
                .toolbarBackground(.navy, for: .tabBar)
                            .toolbarBackground(.visible, for: .tabBar)
        }
        
    }
}

//Testing new Branch
#Preview {
    ContentView()
}
