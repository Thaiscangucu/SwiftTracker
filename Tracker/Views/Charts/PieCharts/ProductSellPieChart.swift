import SwiftUI
import Charts

struct PieProfitChart: Identifiable {
    let id = UUID()
    let title: String
    let revenue: Double
}

struct ProductSellPieChart: View {
    @StateObject var viewModel: ContentViewModel

    var products: [PieProfitChart] {
        [
            PieProfitChart(title: "Compras", revenue: viewModel.totalBuy),
            PieProfitChart(title: "Vendido", revenue: viewModel.totalSell)
        ]
    }

    var body: some View {
        VStack {
            if viewModel.totalBuy > 0 || viewModel.totalSell > 0 {
                Chart(products) { product in
                    SectorMark(
                        angle: .value("Valor", product.revenue)
                    )
                    .foregroundStyle(by: .value("Categoria", product.title))
                }
                .chartForegroundStyleScale([
                    "Compras": Color(.princessBlue),
                    "Vendido": Color.accentColor
                ])
                .frame(width: 125,height: 125)
                .padding()
                .background(Color(.textField))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .tint(Color("textColor")) // legenda estilizada
                .shadow(radius: 5)
            } else {
                Text("Sem dados para exibir o gráfico.")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .onAppear {
            viewModel.totalBuy = 0
            viewModel.totalSell = 0
            viewModel.updateProductValue(products: viewModel.products)
            viewModel.updateSellValue(sells: viewModel.sells)
        }
    }
}
