//
//  ContentView.swift
//  WinnipegSpecials
//
//  Created by Brayden Paley on 2021-01-26.

import SwiftUI

struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
        Group {
            ContentView()
        }
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}



struct ContentView: View {
    var category: [Category] = categoryList
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(hex: "#e06c36ff")

    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    GeometryReader { geometry in
                        ImageCarouselView(numberOfImages: 3) {
                            Image("BrazenHallLogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped().padding(.top, 75)
                            Image("JoeyLogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped().padding(.top, 75)
                            Image("icon1024")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped().padding(.top, 75)
                        }
                    }.frame(height: 200, alignment: .top).ignoresSafeArea().background(Color(hex: 0xe06c36))
                    
                    Spacer()
                        .frame(height: 50)
                    
                    VStack(alignment: .leading, spacing: 20.0) {
                        ForEach(category){ category in
                            CategoryCell(category: category)
                        }
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    }.padding(.leading, 10).padding(.top, 15).padding(.bottom, 20)
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           minHeight: 0,
                           maxHeight: .infinity,
                           alignment: .topLeading)
                    .overlay(Divider().frame(height: 2).background(Color.black), alignment: .top)
                    .ignoresSafeArea().background(Color(hex: /*0x00a4cc*/0x78b1e3)).edgesIgnoringSafeArea(.bottom)
                    
                }.navigationBarHidden(true)
            }.background(Color(hex: 0xe06c36)).ignoresSafeArea()
        }

    }
}



