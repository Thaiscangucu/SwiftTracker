import SwiftUI
import Charts

struct PieProfitChart: Identifiable {
    let id = UUID()
    let title: String
    let revenue: Double
}

struct ProductSellPieChart: View {
    @StateObject var viewModel: ContentViewModel
    @State public var products: [PieProfitChart] = []
    
    @State var totalSell: Double = 0
    @State var totalBuy: Double = 0

    
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
            products.append(PieProfitChart(title: "Vendido", revenue: totalBuy))
            products.append(PieProfitChart(title: "Vendido", revenue: totalSell))
            
        }
        
    }
        
}
