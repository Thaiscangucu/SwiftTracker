import SwiftUI
import Charts
import Foundation

struct ProductRevenue: Identifiable {
    var id = UUID()
    var name: String
    var total: Double
}



struct BestSellersBarChart: View {
    @StateObject var viewModel: ContentViewModel

    var body: some View {
        VStack {
            let grouped = Dictionary(grouping: viewModel.sells, by: { $0.productName ?? "Desconhecido" })
            let aggregated: [ProductRevenue] = grouped.map { (key, sells) in
                ProductRevenue(name: key, total: sells.reduce(0) { $0 + $1.price })
            }

            let sorted = aggregated.sorted { $0.total > $1.total }

            
            let maxTotal = sorted.map { $0.total }.max() ?? 0
            let paddedMax = max(ceil(maxTotal * 1.2), maxTotal + 2.0)

            if !sorted.isEmpty {
                Chart {
                    ForEach(Array(sorted.enumerated()), id: \.1.id) { index, product in
                        BarMark(
                            x: .value("Total Vendido", product.total),
                            y: .value("Produto", product.name)
                        )
                        .foregroundStyle(index.isMultiple(of: 2) ? Color(.princessBlue) : Color.accentColor)
                    }
                }
                .chartXScale(domain: [0, paddedMax])
                .chartPlotStyle { plot in
                    plot.padding(.trailing, 12)
                }
                .frame(width: 200,height: 150)
                .chartLegend(position: .top, alignment: .bottomTrailing)
                .tint(Color("textColor"))
                .background(Color(.textField))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.vertical)
                .shadow(radius: 5)
            } else {
                Text("Sem dados para exibir o gráfico.")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .padding()
        .onAppear {
            viewModel.getSell()
        }
    }
}
