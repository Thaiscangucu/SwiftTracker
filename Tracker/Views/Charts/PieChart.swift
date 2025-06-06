import SwiftUI
import Charts


//TODO: - colocar a comparable dentro da contentViewModel, e no ato da funcao, dar append no item criado
struct Comparable: Identifiable {
    let id = UUID()
    let nameValue: String
    let value: Double
}


struct PieChart: View {
    
    @State private var comparables: [Comparable] = [
        .init(nameValue: "Annual", value: 0.7),
        .init(nameValue: "Monthly", value: 0.2)
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
