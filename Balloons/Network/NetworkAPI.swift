//
//  Apollo.swift
//  Balloons
//
//  Created by Sheikh Ali on 07/09/2021.
//

import Foundation
import Apollo

class NetworkAPI {
    static let shared = NetworkAPI()
    
    lazy var apollo = ApolloClient(url: URL(string: "\(Constants.baseUrl)/graphql")!)
}
