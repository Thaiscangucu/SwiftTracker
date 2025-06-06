//
//  SalesWidgetLiveActivity.swift
//  SalesWidget
//
//  Created by Thais Cangucu on 05/06/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SalesWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct SalesWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SalesWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension SalesWidgetAttributes {
    fileprivate static var preview: SalesWidgetAttributes {
        SalesWidgetAttributes(name: "World")
    }
}

extension SalesWidgetAttributes.ContentState {
    fileprivate static var smiley: SalesWidgetAttributes.ContentState {
        SalesWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: SalesWidgetAttributes.ContentState {
         SalesWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: SalesWidgetAttributes.preview) {
   SalesWidgetLiveActivity()
} contentStates: {
    SalesWidgetAttributes.ContentState.smiley
    SalesWidgetAttributes.ContentState.starEyes
}
