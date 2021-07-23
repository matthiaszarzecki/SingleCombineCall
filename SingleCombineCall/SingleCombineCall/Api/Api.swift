//
//  Api.swift
//  SingleCombineCall
//
//  Created by Matthias Zarzecki on 11.05.21.
//

import Combine
import Foundation

struct Api {
  static func getHouses() -> AnyPublisher<[HouseBasic], Error> {
    let url = URL(string: "https://www.anapioficeandfire.com/api/houses")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    return URLSession.shared
      .dataTaskPublisher(for: request)
      .tryMap {
        return try JSONDecoder().decode(
          [HouseBasic].self,
          from: $0.data
        )
      }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}
