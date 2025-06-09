//
//  SellsWidget.swift
//  SellsWidget
//
//  Created by Thais Cangucu on 09/06/25.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 2 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    //    func relevances() async -> WidgetRelevances<Void> {
    //        // Generate a list containing the contexts this widget is relevant in.
    //    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

struct SellsWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack{
            // TODO: Get real sells value in text
            Text("34")
                .font(.system(size: 70, weight: .bold))
                .foregroundStyle(.texto)
                
            Text("Vendas")
                .font(.title)
                .fontWeight(.bold)
                .minimumScaleFactor(0.6)
                            .foregroundStyle(.texto)
                            
                            
            
        }
        .padding()
    }
}

struct SellsWidget: Widget {
    let kind: String = "SellsWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                SellsWidgetEntryView(entry: entry)
                    .containerBackground(for: .widget){
                        LinearGradient(colors: [Color.backgroundGradient, Color.widgetBackground], startPoint: .bottom, endPoint: .top)
                    }
                
            } else {
                SellsWidgetEntryView(entry: entry)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)    // << here !!
                           .background(Color.widgetBackground)
                    .background()
            }
        }
        .configurationDisplayName("Vendas")
        .description("Vejas suas vendas aqui.")
    }
}

#Preview(as: .systemSmall) {
    SellsWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}
