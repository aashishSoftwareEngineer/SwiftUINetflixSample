//
//  NetflixHeroCell.swift
//  NetflixUI
//
//  Created by Aashish Katiyar on 05/10/24.
//

import SwiftUI

struct NetflixHeroCell: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("iphone16", bundle: nil)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                HStack {
                    Text("N")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundStyle(.netflixDarkRed)
                    Text("FILM")
                        .foregroundStyle(.netflixLightGray)
                        .font(.subheadline)
                        .fontWeight(.light)
                }
                .padding(.top, 40)
                
                Text("iPhone 16")
                    .font(.largeTitle)
                    .foregroundStyle(.netflixWhite)
                    .fontDesign(.serif)
                    .padding(.bottom)
                
                Text("Smartphones . Apple")
                    .font(.subheadline)
                    .foregroundStyle(.netflixWhite)
                
                HStack(spacing: 18) {
                    Button(action: {}, label: {
                        HStack{
                            Image(systemName: "play.fill")
                            Text("Play")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 8)
                        .foregroundStyle(.netflixDarkGray)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .tint(.netflixWhite)
                        )
                    })
                    Button(action: {}, label: {
                        HStack{
                            Image(systemName: "plus")
                            Text("My List")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                        .foregroundStyle(.netflixDarkGray)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .tint(.netflixWhite)
                        )
                    })
                }
            }
            .background(.clear)
            .padding(.horizontal, 30)
            .padding(.bottom, 30)
        }
    }
}

#Preview {
    NetflixHeroCell()
        .padding(40)
}
