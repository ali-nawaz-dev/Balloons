//
//  BalloonsRepository.swift
//  Balloons
//
//  Created by Rashdan Natiq on 16/09/2021.
//

import Foundation

class BalloonsRepository {
    
    func getBalloons(sort: SortInput, variant: Variant, completion: @escaping ([Balloon]?) -> ()) {
        
        let query = BalloonsListQuery(sort: sort, filter_variant: variant)
        
        NetworkAPI.shared.apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
            
            switch result {
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            case .success(let data):
                var balloons: [Balloon] = []
                if let edges = data.data?.balloons.edges {
                    for (_ , item) in edges.enumerated(){
                        let node = item.node
                        if let balloon = node.decodeModel(type: Balloon.self){
                            balloons.append(balloon)
                        }
                    }
                }
               completion(balloons)
            }
            
        }
    }
    
    func getBalloon(id: String, completion: @escaping (Balloon?) -> ()) {
        
        let query = BalloonDetailQuery(id: id)
        
        NetworkAPI.shared.apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
            
            switch result {
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            case .success(let data):
                if let node = data.data?.balloon{
                    if let balloon = node.decodeModel(type: Balloon.self){
                        completion(balloon)
                    }
                }
                completion(nil)
            }
        }
    }
}
