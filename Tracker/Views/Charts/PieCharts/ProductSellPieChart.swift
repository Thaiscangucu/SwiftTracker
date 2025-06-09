import SwiftUI
import Charts

//Erro ao adcionar uma nova venda, ele nao soma. e quando eu deleto a venda(back ele nao remove do grafico)

//Testar primeiro transformando essa struct em classe

struct PieProfitChart: Identifiable {
    let id = UUID()
    let title: String
    let revenue: Double
}

struct ProductSellPieChart: View {
    @StateObject var viewModel: ContentViewModel
    @State public var products: [PieProfitChart] = []
    
    var body: some View {
        Chart(products) { product in
            SectorMark(
                angle: .value(
                    Text(verbatim: product.title),
                    product.revenue
                )
            )
            .foregroundStyle(
                by: .value(
                    Text(verbatim: product.title),
                    product.title
                )
            )
        }
        .onAppear {
            viewModel.updateProductValue(products: viewModel.products)
            viewModel.updateSellValue(sells: viewModel.sells)
            
            products.append(PieProfitChart(title: "Compras", revenue: viewModel.totalBuy))
            products.append(PieProfitChart(title: "Vendido", revenue: viewModel.totalSell))
            
        }
        
    }
        
}
