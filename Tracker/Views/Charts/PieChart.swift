import SwiftUI
import Charts


//TODO: - colocar a comparable dentro da contentViewModel, e no ato da funcao, dar append no item criado
struct Comparable: Identifiable {
    let id = UUID()
    let nameValue: String
    let value: Double
}


struct PieChart: View {
    @ObservedObject var viewModel = ContentViewModel()


    @State private var comparables: [Comparable] = [
        .init(nameValue: "Gasto", value: viewModel.totalBuy),
        .init(nameValue: "Arrecadado", value: viewModel.totalSell)
    ]
    
    var body: some View {
        Chart(comparables) { product in
            SectorMark(
                angle: .value(
                    Text(verbatim: product.nameValue),
                    product.value
                )
            )
            .foregroundStyle(
                by: .value(
                    Text(verbatim: product.nameValue),
                    product.nameValue
                )
            )
        }
    }
}
