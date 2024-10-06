//
//  NetflixHomeView.swift
//  NetflixUI
//
//  Created by Aashish Katiyar on 15/09/24.
//

import SwiftUI

struct NetflixHomeView: View {
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                VStack {
                    Header
                        .padding(.horizontal, 16)
                    NetflixFilterBarView()
                }

                NetflixHeroCell()
                ForEach(0..<20) { _ in
                    Rectangle()
                        .fill(.white)
                        .frame(height: 200)
                }
            }
        }
    }
}

#Preview {
    NetflixHomeView()
}

private var Header: some View {
        HStack {
            Text("To Netflix")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            
            HStack {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        
                    }
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        
                    }
            }
            .font(.title2)
        }
        .foregroundColor(.netflixWhite)
}
