import Charts
import SwiftUI

struct LineChart: View {
    @ObservedObject var viewModel = ContentViewModel()

    var body: some View {
        //TODO: - Não Aparece os dados
        VStack {
            Chart{
                ForEach(viewModel.sells, id: \.self) { sell in
                    
                    LineMark(x: PlottableValue.value("Day", sell.date!), y: PlottableValue.value("Price", sell.price))
                            .foregroundStyle(.linearGradient(colors: [.princessBlue, .blue], startPoint: .top, endPoint: .bottom))
                            
                }
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
            viewModel.getSell()
        }
    }
}


