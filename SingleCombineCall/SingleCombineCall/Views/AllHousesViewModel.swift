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
  
  public func fetchNextPageIfPossible() {
    Api.getHouses()
      .sink(
        receiveCompletion: onReceive,
        receiveValue: onReceive
      )
      .store(in: &subscriptions)
    
    // If after 3 seconds nothing has been loaded, show error
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
      if self.subscriptions.isEmpty {
        state.intitialLoadingPhase = false
        state.showError = true
      }
    }
  }
  
  private func onReceive(_ completion: Subscribers.Completion<Error>) {
    switch completion {
    case .finished:
      state.showError = false
      state.intitialLoadingPhase = false
      break
    case .failure:
      state.showError = true
    }
  }
  
  private func onReceive(houses: [HouseBasic]) {
    state.houses = houses
  }
  
  struct SearchResultsViewState {
    var houses = [HouseBasic]()
    var showError = false
    var intitialLoadingPhase = true
  }
}
