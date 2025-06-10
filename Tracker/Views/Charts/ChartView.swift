import SwiftUI

struct ChartView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        
        NavigationStack{
            VStack{
                CardsSet(viewModel: viewModel)
                ProductBarCharts(viewModel: viewModel)
                
            }
            .navigationTitle("Dashboard")
        }
       
        
    }
}

#Preview {
    ChartView()
}
