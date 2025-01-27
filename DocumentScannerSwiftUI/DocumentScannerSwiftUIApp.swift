//
//  DocumentScannerSwiftUIApp.swift
//  DocumentScannerSwiftUI
//
//  Created by Jorge Mendizabal on 27/01/25.
//

import SwiftUI

@main
struct DocumentScannerSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Document.self)
        }
    }
}
