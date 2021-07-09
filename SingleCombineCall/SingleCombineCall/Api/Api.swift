//
//  Api.swift
//  SingleCombineCall
//
//  Created by Matthias Zarzecki on 11.05.21.
//

import Combine
import Foundation

/// Contains functions to request and
/// receive data from the ApiOfIceAndFire.
struct Api {
  /// Gets 30 ASOIAF Houses.
  static func getHouses() -> AnyPublisher<[HouseBasic], Error> {
    let url = URL(string: "https://www.anapioficeandfire.com/api/houses?page=\(0)&pageSize=\(30)")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    return URLSession.shared
     .dataTaskPublisher(for: request)
      .handleEvents(
        receiveOutput: {
          $0.data.printJsonFromData()
        }
      )
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
