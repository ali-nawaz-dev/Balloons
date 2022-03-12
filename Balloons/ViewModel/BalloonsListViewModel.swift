//
//  BalloonsListViewModel.swift
//  Balloons
//
//  Created by Rashdan Natiq on 16/09/2021.
//

import Foundation

class BalloonsListViewModel: ObservableObject {
  @Published var state: ViewStatus = .none
  @Published var balloons = [Balloon]()
  
  let repo = BalloonsRepository()
  
  init() {
    setup()
  }
  
  func setup() {
    
    state = .loading
    repo.getBalloons(sort: .name,
                     variant: .normal) { balloons in
        
        guard let balloons = balloons else {
            self.state = .error
            return
        }
        
        self.balloons = balloons
        self.state = .complete
    }
  }
}
