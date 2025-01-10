//
//  Untitled.swift
//  NetflixUI
//
//  Created by Aashish Katiyar on 08/01/25.
//

import SwiftUI

struct NetflixDetailView: View {
    var body: some View {
        ScrollView {
            ZStack {
                Image("brandy", bundle: nil)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 200)
                    .background(Color.white)
                VStack {
                    HStack() {
                        Spacer()
                        Button("", systemImage: "tv.badge.wifi") {
                            
                        }
                        Button("", systemImage: "xmark.circle") {
                            
                        }
                    }
                    Spacer()
                    NetflixProgressBar()
                }
            }
            VStack(spacing: 10) {
                HStack {
                    Text("Orange Essance Food Flavour")
                        .foregroundStyle(Color.netflixWhite)
                        .fontWeight(.bold)
                    Spacer()
                }
                HStack {
                    Text("New")
                        .foregroundStyle(Color(hex: 0x00650A))
                    Text("2025  4 Seasons")
                        .foregroundStyle(Color.netflixWhite)
                    Image(systemName: "text.bubble")
                        .foregroundStyle(Color.netflixWhite)
                    Spacer()
                }
                HStack {
                    VStack(spacing: -4) {
                        Text("Top")
                            .font(Font.caption)
                        Text("10")
                            .font(Font.title3)
                    }
                    .frame(width: 30, height: 35)
                    .foregroundStyle(Color.netflixWhite)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.red)
                    )
                    
                    Text("#6 in TV Shows Today")
                        .foregroundStyle(Color.netflixWhite)
                        .fontWeight(.bold)
                    Spacer()

                }
                Button {
                    
                } label:{
                HStack {
                    Image(systemName: "play.fill")
                        .foregroundStyle(Color.netflixBlack)
                    Text("Play")
                        .foregroundStyle(Color.netflixBlack)
                }
                .frame(maxWidth: .infinity, minHeight: 40)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundStyle(Color.netflixWhite)
                )
            }
                Button {
                    
                } label:{
                HStack {
                    Image(systemName: "dock.arrow.down.rectangle")
                        .foregroundStyle(Color.netflixWhite)
                    Text("Download")
                        .foregroundStyle(Color.netflixWhite)
                }
                .frame(maxWidth: .infinity, minHeight: 40)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundStyle(Color.netflixDarkGray)
                )
            }
                ExpandableText("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut laborum", lineLimit: 6)
                    .foregroundStyle(Color.netflixWhite)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
        .background(Color.netflixBlack)
    }
}


#Preview {
    NetflixDetailView()
}

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0x00FF00) >> 8) / 255.0
        let blue = Double(hex & 0x0000FF) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}

struct ExpandableText: View {
    @State private var expanded: Bool = false
    @State private var truncated: Bool = false
    @State private var shrinkText: String
    private var text: String
    let font: UIFont
    let lineLimit: Int
    private var moreLessText: String {
        if !truncated {
            return ""
        } else {
            return self.expanded ? " read less" : " ... read more"
        }
    }
    
    init(_ text: String, lineLimit: Int, font: UIFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)) {
        self.text = text
        self.lineLimit = lineLimit
        _shrinkText =  State(wrappedValue: text)
        self.font = font
    }
    
    var body: some View {
        
        
        ZStack(alignment: .bottomLeading) {
            Group {
                        Text(self.expanded ? text : shrinkText)
                        + Text(moreLessText)
                        .bold()
                        .foregroundColor(.blue)
                
            }.animation(.default, value: 1)
            .lineLimit(expanded ? nil : lineLimit)
                .background(
                    // Render the limited text and measure its size
                    Text(text).lineLimit(lineLimit)
                        .background(GeometryReader { visibleTextGeometry in
                            Color.clear.onAppear() {
                                let size = CGSize(width: visibleTextGeometry.size.width, height: .greatestFiniteMagnitude)
                                let attributes:[NSAttributedString.Key:Any] = [NSAttributedString.Key.font: font]
                                ///Binary search until mid == low && mid == high
                                var low  = 0
                                var heigh = shrinkText.count
                                var mid = heigh ///start from top so that if text contain we does not need to loop
                                while ((heigh - low) > 1) {
                                    let attributedText = NSAttributedString(string: shrinkText + moreLessText, attributes: attributes)
                                    let boundingRect = attributedText.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
                                    if boundingRect.size.height > visibleTextGeometry.size.height {
                                        truncated = true
                                        heigh = mid
                                        mid = (heigh + low)/2
                                        
                                    } else {
                                        if mid == text.count {
                                            break
                                        } else {
                                            low = mid
                                            mid = (low + heigh)/2
                                        }
                                    }
                                    shrinkText = String(text.prefix(mid))
                                }
                                if truncated {
                                    shrinkText = String(shrinkText.prefix(shrinkText.count - 2))  //-2 extra as highlighted text is bold
                                }
                            }
                        })
                        .hidden() // Hide the background
            )
            .font(Font(font)) ///set default font
            if truncated {
                Button(action: {
                    expanded.toggle()
                }, label: {
                    HStack { //taking tap on only last line, As it is not possible to get 'see more' location
                        Spacer()
                        Text("")
                    }.opacity(0)
                })
            }
        }
    }

}
