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

struct ProductLineChart: View {
    var LineData: [LineChartItem]
    
    var body: some View {
        VStack {
            Chart(LineData) {
                LineMark(
                    x: .value("Dia", $0.date),
                    y: .value("Estoque", $0.stock)
                )
                .foregroundStyle(.princessBlue)
                
            }
            .frame(width: 150,height:150)
            .chartLegend(position: .top, alignment: .bottomTrailing)
            .chartYAxis(.hidden)
            .background(.textField)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .chartForegroundStyleScale([
                "Produtos em estoque": Color(.princessBlue)
            ])
            .padding(.vertical)
            .shadow(radius: 5)
        }
    }
}



