//
//  NetflixFilterBarView.swift
//  NetflixUI
//
//  Created by Aashish Katiyar on 02/10/24.
//

import SwiftUI

struct FilterModel: Hashable, Equatable {
    var title: String = ""
    var isDropdown:Bool = false
    var isSelected:Bool = true
    
    static let filterArray = [
    FilterModel(title: "TV Shows", isDropdown: true, isSelected: false),
    FilterModel(title: "Movies", isDropdown: true, isSelected: false),
    FilterModel(title: "Others", isDropdown: false, isSelected: false)
    ]
}

struct NetflixFilterBarView: View {
    let array: [FilterModel] = FilterModel.filterArray
    @State var selectedFilter: FilterModel? = nil
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(lineWidth: 1)
                        )
                        .foregroundStyle(.netflixLightGray)
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            selectedFilter = nil
                        }
                }
                
                ForEach(array, id: \.self) { object in
                    NetflixFilterCell(
                        title: object.title,
                        isDropdown: object.isDropdown,
                        isSelected: selectedFilter == object)
                        .onTapGesture {
                            selectedFilter = object
                        }
                        .padding(1)
                }
            }
            .padding(.vertical, 4)
        }
        .scrollIndicators(.hidden)
        .animation(.interactiveSpring, value: selectedFilter)
        .padding(.horizontal, 10)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        NetflixFilterBarView()
    }
}
