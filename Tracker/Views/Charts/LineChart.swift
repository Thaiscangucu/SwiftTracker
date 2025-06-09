import SwiftUI
import Foundation
import Charts


extension Date {
    var onlyDate: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: self)
        return calendar.date(from: components)!
    }
}

struct LineChart: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            if !viewModel.products.isEmpty {
                Chart {
                    ForEach(viewModel.products.compactMap({ product -> (date: Date, stock: Double)? in
                        guard let date = product.dateProduct else { return nil }
                        return (date.onlyDate, product.stock)
                    }), id: \.date) { item in
                        LineMark(
                            x: .value("Dia", item.date),
                            y: .value("Estoque", item.stock)
                        )
                    }
                }
                .frame(height: 300)
                .padding()
            } else {
                Text("Sem dados para exibir o gráfico.")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .navigationTitle("Evolução do Estoque")
    }
}



