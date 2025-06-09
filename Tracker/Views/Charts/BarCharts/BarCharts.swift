import SwiftUI
import Charts

struct ProductBarCharts: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            //SellsLineChart(LineData: viewModel.linearSellsData)
            ProductLineChart(LineData: viewModel.linearChartData)

            if !viewModel.products.isEmpty{
                Chart{
                    ForEach(viewModel.products){ product in
                        BarMark(x: PlottableValue.value("Product", product.name ?? ""), y: PlottableValue.value("Stock", product.stock))
                            .foregroundStyle(.linearGradient(colors: [.princessBlue, .blue], startPoint: .top, endPoint: .bottom))
                        
                    }}
                .frame(height:200)
                .chartLegend(position: .top, alignment: .bottomTrailing)
                .chartYAxis(.hidden)
                .background(.textField)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .chartForegroundStyleScale([
                    "Products": Color(.princessBlue)
                ])
                .padding(.vertical)
                .shadow(radius: 5)
            }else{
                Text("Sem dados para exibir o gráfico.")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .padding()
        .onAppear{
            viewModel.getProduct()
            viewModel.getSell()
        }
    }
}


