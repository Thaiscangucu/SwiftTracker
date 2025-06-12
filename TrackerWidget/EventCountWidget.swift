
import WidgetKit
import SwiftUI

// MARK: - Total event entry
struct EventEntry: TimelineEntry {
    let date: Date
    let totalEvents: Double
}

// MARK: - Read app group
struct EventProvider: TimelineProvider {
    func placeholder(in context: Context) -> EventEntry {
        EventEntry(date: Date(), totalEvents: 0)
    }

    func getSnapshot(in context: Context, completion: @escaping (EventEntry) -> Void) {
        let entry = EventEntry(date: Date(), totalEvents: lerEventosDoDia())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<EventEntry>) -> Void) {
        let entry = EventEntry(date: Date(), totalEvents: lerEventosDoDia())
        let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(60 * 15)))
        completion(timeline)
    }

    private func lerEventosDoDia() -> Double {
        let defaults = UserDefaults(suiteName: "group.com.joaovitor.swifttracker")
        return defaults?.double(forKey: "dailyEvents") ?? 0
    }
}

// MARK: - Widget View
struct EventCountWidgetEntryView: View {
    var entry: EventProvider.Entry

    var body: some View {
        ZStack {
            Color(.systemBackground)
            VStack(alignment: .leading, spacing: 8) {
                Text("Eventos Hoje")
                    .font(.headline)
                    .foregroundColor(.primary)

                Text("\(Int(entry.totalEvents))")
                    .font(.title)
                    .bold()
                    .foregroundColor(.blue)
            }
            .padding()
        }
    }
}

// MARK: - Widget principal
struct EventCountWidget: Widget {
    let kind: String = "EventCountWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: EventProvider()) { entry in
            EventCountWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Contagem de Eventos")
        .description("Veja quantos eventos você tem hoje.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

// MARK: - Preview
#Preview(as: .systemSmall) {
    EventCountWidget()
} timeline: {
    EventEntry(date: .now, totalEvents: 2)
    EventEntry(date: .now, totalEvents: 5)
}
