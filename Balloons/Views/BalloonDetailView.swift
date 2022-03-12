//
//  BalloonDetailView.swift
//  Balloons
//
//  Created by Rashdan Natiq on 16/09/2021.
//

import Foundation
import SwiftUI

struct BalloonDetailScrollView: View {
    
    var balloons: [Balloon]
    @State var selectedTab: Int
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                TabView (selection: $selectedTab) {
                    ForEach(Array(balloons.enumerated()),
                            id: \.offset) { index,
                                            balloon in
                        BalloonDetailView(balloon: balloon)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0,
                                                        style: .continuous))
                            .tag(index)
                    }.padding(.all,
                              10)
                }
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height  - 120)
                .tabViewStyle(PageTabViewStyle())
            }
        }
    }
}

struct BalloonDetailView: View {
    
    @State var balloon: Balloon
    @State private var balloonDesignComment: String = ""
    
    var body: some View{
        VStack {
            RemoteImage(url: "\(Constants.baseUrl)\(balloon.imageUrl)")
                .scaledToFit()
                .padding()
            Text(balloon.name)
                .foregroundColor(.red)
                .fontWeight(.bold)
            TextField("Add design comment here...", text: $balloonDesignComment)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.black)
            Button {
                print("Order pressed")
            } label: {
                Text("Order Here")
            }.disabled(true)
            Spacer()
        }.padding()
        .navigationBarTitle("Balloon Detail")
    }
}
