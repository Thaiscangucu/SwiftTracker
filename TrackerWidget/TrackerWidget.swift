
import WidgetKit
import SwiftUI

// MARK: - Entry com total de vendas
struct SimpleEntry: TimelineEntry {
    let date: Date
    let totalSales: Double
}

// MARK: - Provider que lê os dados do App Group
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), totalSales: 0.0)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(), totalSales: lerTotalDeVendas())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        let entry = SimpleEntry(date: Date(), totalSales: lerTotalDeVendas())
        let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(60 * 15)))
        completion(timeline)
    }

    private func lerTotalDeVendas() -> Double {
        let defaults = UserDefaults(suiteName: "group.com.joaomirandawidget.swifttracker")
        return defaults?.double(forKey: "dailySales") ?? 0.0
    }
}

// MARK: - View do widget
struct TrackerWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
    
            VStack(alignment: .leading, spacing: 8) {
                Text("Vendas Hoje")
                    .font(.headline)
                    .foregroundColor(.texto)

                Text("R$ \(entry.totalSales, specifier: "%.2f")")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.texto)
            }
            .padding()
        }
    }
}

// MARK: - Widget principal
struct TrackerWidget: Widget {
    let kind: String = "TrackerWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TrackerWidgetEntryView(entry: entry)
                .containerBackground(for: .widget){
                    LinearGradient(colors: [Color.backgroundGradient, Color.widgetBackground], startPoint: .bottom, endPoint: .top)
                }
            
        }
        .configurationDisplayName("Resumo de Vendas")
        .description("Veja rapidamente o total vendido hoje.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

// MARK: - Preview
#Preview(as: .systemSmall) {
    TrackerWidget()
} timeline: {
    SimpleEntry(date: .now, totalSales: 199.90)
    SimpleEntry(date: .now, totalSales: 620.00)
}
