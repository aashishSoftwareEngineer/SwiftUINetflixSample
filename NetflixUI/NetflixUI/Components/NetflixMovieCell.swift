//
//  NetflixMovieCell.swift
//  NetflixUI
//
//  Created by Aashish Katiyar on 07/10/24.
//

import SwiftUI

struct NetflixMovieCell: View {
    @State var imageURL: String = "iphone16"
    @State var isTop10: Bool = true
    
    var body: some View {
        ZStack(alignment: .bottom) {
            HStack(spacing: 0) {
                if isTop10 {
                    Text("1")
                        .font(.system(size: 100, weight: .medium, design: .serif))
                        .foregroundStyle(.netflixWhite)
                        .offset(x: 10)
                }
                Image(imageURL)
                    .resizable()
                    .cornerRadius(8)
            }
            
            VStack(spacing: 0) {
                Text("Movie")
                    .font(.caption)
                    .foregroundStyle(.netflixWhite)
                
                Text("Recently Added")
                    .padding(.horizontal, 4)
                    .padding(.vertical, 2)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 2)
                    .background(.netflixRed)
                    .cornerRadius(3)
                    .offset(y: 2)
                    .font(.caption2)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                    .foregroundStyle(.netflixWhite)
                    .padding(.horizontal, 8)
            }
            .cornerRadius(5)
        }
        .frame(width: isTop10 ? 120 : 90, height: 140)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        NetflixMovieCell()
        NetflixMovieCell()
    }
}
