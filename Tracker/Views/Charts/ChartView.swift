import SwiftUI

struct ChartView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        
        NavigationStack{
            ScrollView{
                VStack{
                    CardsSet(viewModel: viewModel)
                    ProductBarCharts(viewModel: viewModel)
                    HStack{
                        ProductLineChart(LineData: viewModel.linearChartData)
                            .padding(.trailing, 50)
                        ProductSellPieChart(viewModel: viewModel)
                    }
                    .padding(.horizontal)
                    HStack{
                        BestSellersBarChart(viewModel: viewModel)
                        Spacer()
                        SellsLineChart(LineData: viewModel.linearSellsData)
                    }
                    .padding(.horizontal)

                    
                    
                }
            }
            .navigationTitle("Dashboard")
        }
       
        
    }
}

#Preview {
    ChartView()
}
