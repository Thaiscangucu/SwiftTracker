import Charts
import SwiftUI

struct LineChart: View {
    @ObservedObject var viewModel = ContentViewModel()

    var body: some View {
        //TODO: - Não Aparece os dados
        VStack {
            Chart{
                ForEach(viewModel.products, id: \.id) { product in
                    BarMark(
                                            x: .value("Weekday", product.dateProduct!),
                                            y: .value("Count", product.stock)
                                        )
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


