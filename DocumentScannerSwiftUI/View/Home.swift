//
//  Home.swift
//  DocumentScannerSwiftUI
//
//  Created by Jorge Mendizabal on 27/01/25.
//

import SwiftUI
import SwiftData

struct Home: View {
    
    @State private var showScannerView: Bool = false
    @Query(sort: [.init(\Document.createdAt, order: .reverse)],
           animation: .snappy(duration: 0.25,
                              extraBounce: 0)) private var documents: [Document]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 2), spacing: 15) {
                    ForEach(documents) { document in
                        
                    }
                }
                .padding(15)
            }
            .navigationTitle("Document's")
            .safeAreaInset(edge: .bottom) {
                CreateButton()
            }
        }
        .fullScreenCover(isPresented: $showScannerView) {
            ScannerView { _ in
                
            } didCancel: {
                
            } didFinish: { document in
                
            }
            .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    private func CreateButton() -> some View {
        Button {
            showScannerView.toggle()
        } label: {
            HStack(spacing: 6) {
                Image(systemName: "document.viewfinder.fill")
                    .font(.title3)
                Text("Scan Documents")
            }
            .foregroundStyle(.white)
            .fontWeight(.semibold)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(.purple.gradient, in: .capsule)
        }
        .hSpacing(.center)
        .padding(.vertical, 10)
        .background {
            Rectangle()
                .fill()
                .mask {
                    Rectangle()
                        .fill(.linearGradient(colors: [.white.opacity(0.0),
                                                       .white.opacity(0.05),
                                                       .white.opacity(0.10),
                                                       .white.opacity(0.15),
                                                       .white.opacity(0.20)],
                                              startPoint: .top,
                                              endPoint: .bottom))
                }
                .ignoresSafeArea()
        }

    }
    
}

#Preview {
    Home()
}
 
