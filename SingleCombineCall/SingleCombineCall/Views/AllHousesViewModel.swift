//
//  AllHousesViewModel.swift
//  SingleCombineCall
//
//  Created by Matthias Zarzecki on 11.05.21.
//

import Combine
import SwiftUI

class AllHousesViewModel: ObservableObject {
  @Published private(set) var state = SearchResultsViewState()
  
  private var subscriptions = Set<AnyCancellable>()
  
  init() {
    Api.getHouses()
      .sink(
        receiveCompletion: onReceiveCompletion,
        receiveValue: onReceiveValue
      )
      .store(in: &subscriptions)
  }
  
  private func onReceiveCompletion(_ completion: Subscribers.Completion<Error>) {
    switch completion {
    case .finished:
      print("Success!")
      break
    case .failure:
      print("Failure!")
      break
    }
  }
  
  private func onReceiveValue(houses: [HouseBasic]) {
    state.houses = houses
  }
  
  struct SearchResultsViewState {
    var houses = [HouseBasic]()
  }
}
