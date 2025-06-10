import SwiftUI
import Charts

struct ProductBarCharts: View {
    @StateObject var viewModel: ContentViewModel

    var body: some View {
        VStack {
            if !viewModel.products.isEmpty {
                let maxStock = viewModel.products.map { $0.stock }.max() ?? 0
                let paddedMax = maxStock * 1.1  // Garantee Spacing

                Chart {
                    ForEach(Array(viewModel.products.enumerated()), id: \.1.id) { index, product in
                        BarMark(
                            x: PlottableValue.value("Product", product.name ?? ""),
                            y: PlottableValue.value("Stock", product.stock)
                        )
                        .foregroundStyle(index.isMultiple(of: 2) ? Color(.princessBlue) : Color.yellowcolor)
                    }
                }
                .chartYScale(domain: [0, paddedMax])
                .frame(width: 380,height: 200)
                .chartLegend(position: .top, alignment: .bottomTrailing)
                .tint(Color(.text))
                .chartYAxis(.hidden)
                .background(.textField)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                //.padding(.vertical)
                .padding(.bottom, 0.5)
                .shadow(radius: 5)
            } else {
                Text("Sem dados para exibir o gráfico.")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .padding()
        .onAppear {
            viewModel.getProduct()
            viewModel.getSell()
        }
    }
}
