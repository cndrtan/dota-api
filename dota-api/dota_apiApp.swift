//
//  dota_apiApp.swift
//  dota-api
//
//  Created by Candra Winardi on 24/11/22.
//

import SwiftUI

@main
struct dota_apiApp: App {
    var body: some Scene {
        WindowGroup {
            HeroView(filter: "All", sort: "Base Health")
        }
    }
}
