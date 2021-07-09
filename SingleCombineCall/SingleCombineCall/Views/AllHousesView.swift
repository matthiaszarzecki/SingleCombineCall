//
//  AllHousesView.swift
//  SingleCombineCall
//
//  Created by Matthias Zarzecki on 11.05.21.
//

import SwiftUI

/// Shows a list of all ASOIAF Houses.
struct AllHousesView: View {
  @ObservedObject private var allHousesViewModel = AllHousesViewModel()
  
  var body: some View {
    AllHousesDisplay(
      fetchResults: allHousesViewModel.state.houses,
      showError: allHousesViewModel.state.showError,
      intitialLoadingPhase: allHousesViewModel.state.intitialLoadingPhase
    )
    .onAppear {
      allHousesViewModel.fetchNextPageIfPossible()
    }
  }
}

struct AllHousesDisplay: View {
  let fetchResults: [HouseBasic]
  var showError: Bool
  var intitialLoadingPhase: Bool
  
  var body: some View {
    NavigationView {
      if intitialLoadingPhase {
        Text("Loading")
      } else if showError {
        Text("Error")
      } else {
        List {
          ForEach(fetchResults) { house in
            Text("\(house.name)")
          }
        }
        .navigationTitle("All Houses of Westeros")
      }
    }
    .accentColor(.red)
  }
}

struct AllHousesDisplay_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AllHousesDisplay(
        fetchResults: MockClasses.housesBasic,
        showError: false,
        intitialLoadingPhase: false
      )
      
      AllHousesDisplay(
        fetchResults: MockClasses.housesBasic,
        showError: false,
        intitialLoadingPhase: false
      )
      
      AllHousesDisplay(
        fetchResults: MockClasses.housesBasic,
        showError: true,
        intitialLoadingPhase: false
      )
      
      AllHousesDisplay(
        fetchResults: MockClasses.housesBasic,
        showError: false,
        intitialLoadingPhase: true
      )
    }
  }
}
