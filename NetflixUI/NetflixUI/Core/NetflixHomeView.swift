//
//  NetflixHomeView.swift
//  NetflixUI
//
//  Created by Aashish Katiyar on 15/09/24.
//

import SwiftUI

struct NetflixHomeView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.netflixBlack.ignoresSafeArea()

            ScrollView(.vertical) {
                VStack(spacing: 8) {
                    
                    NetflixHeroCell()
                        .padding(.top, 120)
                    ForEach(0..<20) { _ in
                        Rectangle()
                            .fill(.white)
                            .frame(height: 200)
                    }
                }
            }
            VStack(spacing: 0) {
                Header
                    .padding(.horizontal, 16)
                NetflixFilterBarView()
                    .padding(.top, 16)
            }
            .background(.netflixBlack)
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
