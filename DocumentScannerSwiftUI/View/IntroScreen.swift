//
//  IntroScreen.swift
//  DocumentScannerSwiftUI
//
//  Created by Jorge Mendizabal on 27/01/25.
//

import SwiftUI

struct IntroScreen: View {
    @AppStorage("showIntroView") private var showIntroView = true
    var body: some View {
        VStack(spacing: 15) {
            Text("What's new in \nDocument Scanner")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .padding(.bottom, 35)
            
            VStack(alignment: .leading, spacing: 25) {
                PointView(title: "Scan Documents",
                          image: "scanner",
                          description: "Scan any document with ease.")
                
                PointView(title: "Save Documents",
                          image: "tray.full.fill",
                          description: "Persist scanned documents with the new SwiftData Model")
                
                
                PointView(title: "Lock Documents",
                          image: "faceid",
                          description: "Protect your documents with biometric authentication")
            }
            .padding(.horizontal, 25)
            
            Spacer(minLength: 0)
            
            Button {
                self.showIntroView = false
            } label: {
                Text("Start Scanning")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .hSpacing(.center)
                    .padding(.vertical, 12)
                    .background(.purple.gradient,
                                in: .capsule)
            }
            
        }
        .padding(15)
    }
    
    @ViewBuilder
    private func PointView(title: String, image: String, description: String) -> some View {
        HStack(spacing: 15) {
            Image(systemName: image)
                .font(.largeTitle)
                .foregroundStyle(.purple)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(description)
                    .font(.callout)
                    .foregroundStyle(.gray)
            }
        }
    }
    
}

#Preview {
    IntroScreen()
}
