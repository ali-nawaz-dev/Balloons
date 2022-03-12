//
//  ContentView.swift
//  Balloons
//
//  Created by Rashdan Natiq on 07/09/2021.
//

import SwiftUI
import Apollo

struct BalloonListView: View {
    
    @ObservedObject var viewModel = BalloonsListViewModel()
    
    var body: some View {
        if viewModel.state == .loading {
            Spinner(style: .large)
        } else if viewModel.state == .error {
            Text("Error.")
        } else if viewModel.state == .complete {
            NavigationView {
                List {
                    ForEach(Array(viewModel.balloons.enumerated()),
                            id: \.offset) { index,
                                            element in
                        NavigationLink(
                            destination: BalloonDetailScrollView(balloons: viewModel.balloons,
                                                                 selectedTab: index) ,
                            label: {
                                BalloonRow(balloon: element)
                            })
                    }
                }
                .navigationBarTitle(Text("Balloons"))
                .navigationBarItems(trailing: Button {
                    viewModel.setup()
                } label:{
                    Text("Refresh")
                })
            }
        }
    }
}

struct BalloonRow: View {
    let balloon: Balloon
    
    var body: some View{
        VStack {
            RemoteImage(url: "\(Constants.baseUrl)\(balloon.imageUrl)")
                .scaledToFit()
                .padding()
            Spacer()
            Text(balloon.name)
                .foregroundColor(.red)
                .fontWeight(.bold)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BalloonListView()
    }
}
