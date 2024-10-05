//
//  NetflixFilterCell.swift
//  NetflixUI
//
//  Created by Aashish Katiyar on 02/10/24.
//

import SwiftUI

struct NetflixFilterCell: View {
    var title: String = "Categories"
    var isDropdown: Bool = true
    var isSelected: Bool = false
    
    var body: some View {
        HStack {
            Text(verbatim: title)
            if isDropdown {
                Image(systemName: "chevron.down")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(
            ZStack {
                if isSelected {
                    Capsule(style: .circular)
                        .fill(.netflixDarkGray)
                } else {
                    Capsule(style: .circular)
                        .stroke(lineWidth: 1)
                }
            }
        )
        .foregroundColor(.netflixLightGray)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            NetflixFilterCell()
            NetflixFilterCell(isDropdown: false)
            NetflixFilterCell(isSelected: false)
        }
    }
}
