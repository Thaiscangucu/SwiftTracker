import SwiftUI
import Charts

struct PieChart: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    //TODO: - Mudar os valores do Grafico para percentual de lucro
    var body: some View {
        Chart{
            ForEach(viewModel.products, id: \.self) { product in
                SectorMark(angle: .value("Stock", product.stock))
                    .foregroundStyle(by: .value("Product", product.name!))
                        
            }
        }
    }
}

#Preview {
    PieChart()
}
