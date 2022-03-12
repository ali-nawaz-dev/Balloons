//
//  BalloonDetailViewModel.swift
//  Balloons
//
//  Created by Sheikh Ali on 16/09/2021.
//

import Foundation

class BalloonDetailViewModel: ObservableObject {
    
  @Published var state: ViewStatus = .none
  @Published var balloon = Balloon(id: "new",
                                   name: "",
                                   imageUrl: "",
                                   description: "",
                                   price: 1,
                                   availableSince: "")

  let repo = BalloonsRepository()

  func setup(balloonId: String) {

    state = .loading

    repo.getBalloon(id: balloonId, completion: { balloon in
        
        guard let balloon = balloon else {
          self.state = .error
          return
        }

        self.balloon = balloon
        self.state = .complete
    })
  }
}
