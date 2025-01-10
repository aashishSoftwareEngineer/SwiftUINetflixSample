//
//  NetflixProgressBar.swift
//  NetflixUI
//
//  Created by Aashish Katiyar on 09/01/25.
//

import SwiftUI

struct NetflixProgressBar: View {
    var progress: Double = 0.37
    var width: Double = UIScreen.main.bounds.width
    var cornerRadius1 = 12.5
    var cornerRadius2 = 10
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 2)
                .frame(maxWidth: width, maxHeight: 5)
                .foregroundStyle(Color.netflixLightGray)
            RoundedRectangle(cornerRadius: 2)
                .frame(maxWidth: progress * (width-5), maxHeight: 2)
                .foregroundStyle(Color.netflixRed)
                .offset(x: 2.5)
        }
        .padding(.horizontal, 2)
    }
}

#Preview {
    NetflixProgressBar()
}
