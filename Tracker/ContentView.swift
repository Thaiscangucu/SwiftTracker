import SwiftUI



struct ContentView: View {
    var body: some View {
        TabView{
            ChartView()
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
//            Sheets()
//                .tabItem{
//                    Label("Sheets", systemImage: "doc.text")
//                }
//                .toolbarBackground(.navy, for: .tabBar)
//                            .toolbarBackground(.visible, for: .tabBar)
        }
        
    }
}


#Preview {
    ContentView()
}
