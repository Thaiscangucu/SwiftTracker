import SwiftUI
import Charts

struct BestSellersBarChart: View {
    @StateObject var viewModel: ContentViewModel

    var body: some View {
        VStack {
            if !viewModel.sells.isEmpty{
                Chart{
                    ForEach(viewModel.sells){ sell in
                        BarMark(x: PlottableValue.value("Sold", sell.price), y: PlottableValue.value("Product", sell.productName ?? ""))
                            .foregroundStyle(.linearGradient(colors: [.princessBlue, .blue], startPoint: .top, endPoint: .bottom))
                        
                    }}
                .frame(height:200)
                .chartLegend(position: .top, alignment: .bottomTrailing)
                .background(.textField)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .chartForegroundStyleScale([
                    "Products": Color(.princessBlue)
                ])
                .padding(.vertical)
                .shadow(radius: 5)
            }else{
                Text("Sem dados para exibir o gráfico.")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .padding()
        .onAppear{
            viewModel.getProduct()
            viewModel.getSell()
        }
    }
}


