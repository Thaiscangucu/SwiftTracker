import SwiftUI
import Foundation
import Charts


struct SellsLineChart: View {
    var LineData: [LineChartItem]
    
    var body: some View {
        VStack {
            Chart(LineData) {
                LineMark(
                    x: .value("Dia", $0.date),
                    y: .value("Vendas", $0.stock)
                )
                .foregroundStyle(.princessBlue)
                
            }
            .frame(width: 150,height:150)
            .chartLegend(position: .top, alignment: .bottomTrailing)
            .chartYAxis(.hidden)
            .background(.textField)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .chartForegroundStyleScale([
                "Valor Arrecadado por dia": Color(.princessBlue)
            ])
            .padding(.vertical)
            .shadow(radius: 5)
        }
    }
}



