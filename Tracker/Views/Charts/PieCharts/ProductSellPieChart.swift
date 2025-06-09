struct ProductSellPieChart: View {
    @StateObject var viewModel: ContentViewModel

    var products: [PieProfitChart] {
        return [
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
            viewModel.updateProductValue(products: viewModel.products)
            viewModel.updateSellValue(sells: viewModel.sells)
        }
    }
}
