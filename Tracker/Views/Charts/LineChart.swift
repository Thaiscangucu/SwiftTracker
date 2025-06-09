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


/*


import SwiftUI
import Charts

struct EstoqueChartView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            if !viewModel.products.isEmpty {
                Chart {
                    ForEach(viewModel.products.compactMap({ product in
                        guard let date = product.dateProduct else { return nil }
                        return (date: date.onlyDate, stock: product.stock)
                    }), id: \.date) { item in
                        LineMark(
                            x: .value("Dia", item.date),
                            y: .value("Estoque", item.stock)
                        )
                    }
                }
                .frame(height: 300)
                .padding()
            } else {
                Text("Sem dados para exibir o gráfico.")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .navigationTitle("Evolução do Estoque")
    }
}

*/

