//
//  MyAsyncImage.swift
//  NetflixUI
//
//  Created by Aashish Katiyar on 07/10/24.
//

import SwiftUI

struct MyAsyncImage: View {    
    
    var body: some View {
        HStack {}
    }
}

struct TestCustomBinding: View {
    @State private var isFirst = true
    @State private var isSecond = false
    var body: some View {
        VStack {
            Button("TestIt") {
                self.isSecond = true
            }
            .sheet(isPresented: ($isFirst)) {
                Button("CloseMe") {
                    // sheet MUST be closed explicitly via one of states !
                    self.isSecond = false
                }
            }
        }
    }
}
