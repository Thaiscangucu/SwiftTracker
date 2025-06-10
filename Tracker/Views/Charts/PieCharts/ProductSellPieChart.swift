import SwiftUI
import Charts

/*Simple struct used in pie Chart*/

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
            // Set as 0 to make sure its not duplicating data
            viewModel.totalBuy = 0
            viewModel.totalSell = 0

            // Update data Values
            viewModel.updateProductValue(products: viewModel.products)
            viewModel.updateSellValue(sells: viewModel.sells)
        }
    }
}
