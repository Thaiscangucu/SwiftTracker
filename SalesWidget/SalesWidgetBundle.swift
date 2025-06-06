//
//  SalesWidgetBundle.swift
//  SalesWidget
//
//  Created by Thais Cangucu on 05/06/25.
//

import WidgetKit
import SwiftUI

@main
struct SalesWidgetBundle: WidgetBundle {
    var body: some Widget {
        SalesWidget()
        SalesWidgetControl()
        SalesWidgetLiveActivity()
    }
}
