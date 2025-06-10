import SwiftUI
import Charts

// Classe simples para o gráfico de pizza
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
        Chart(products) { product in
            SectorMark(
                angle: .value(product.title, product.revenue)
            )
            .foregroundStyle(by: .value(product.title, product.title))
        }
        .onAppear {
            // Zera os totais antes de atualizar (evita soma duplicada)
            viewModel.totalBuy = 0
            viewModel.totalSell = 0

            // Atualiza os dados do gráfico com base nas vendas e compras atuais
            viewModel.updateProductValue(products: viewModel.products)
            viewModel.updateSellValue(sells: viewModel.sells)
        }
    }
}
