import SwiftUI
import Charts

struct BarCharts: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            PieChart()
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
        }
        .padding()
        .onAppear{
            viewModel.getProduct()
        }
    }
}


