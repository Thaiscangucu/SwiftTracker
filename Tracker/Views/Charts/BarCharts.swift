import SwiftUI
import Charts

struct BarCharts: View {
    @ObservedObject var viewModel = ContentViewModel()

    var body: some View {
        VStack {
            Chart{
                ForEach(viewModel.products, id: \.self) { product in
                    
                    BarMark(x: PlottableValue.value("Product", product.name!), y: PlottableValue.value("Sold", product.sold))
                    
                }
            }
        }
        .onAppear{
            viewModel.getProduct()
        }
    }
}


