//
//  Document.swift
//  DocumentScannerSwiftUI
//
//  Created by Jorge Mendizabal on 27/01/25.
//

import SwiftUI
import SwiftData

@Model
class Document {
    var name: String
    var createdAt: Date = Date()
    @Relationship(deleteRule: .cascade, inverse: \DocumentPage.document)
    var pages: [DocumentPage]?
    var isLocked: Bool = false
    // For zoom transition
    var uniqueViewId: String = UUID().uuidString
    
    
    init(name: String, pages: [DocumentPage]? = nil) {
        self.name = name
        self.pages = pages
    }
}


