import SwiftUI
import Charts

struct BarCharts: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
    
            Chart{
                
                BarMark(x: PlottableValue.value("Product", 10), y: PlottableValue.value("Sold", 20))
                    .foregroundStyle(.linearGradient(colors: [.princessBlue, .blue], startPoint: .top, endPoint: .bottom))
                
                
                
            }
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


