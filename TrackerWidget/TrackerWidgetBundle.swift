//
//  TrackerWidgetBundle.swift
//  TrackerWidget
//
//  Created by João Vitor Rocha Miranda on 11/06/25.
//

import WidgetKit
import SwiftUI

@main
struct TrackerWidgetBundle: WidgetBundle {
    var body: some Widget {
        TrackerWidget()
        EventCountWidget()
    }
}
