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
      houses: allHousesViewModel.state.houses
    )
    .onAppear {
      allHousesViewModel.loadHouses()
    }
  }
}

struct AllHousesDisplay: View {
  let houses: [HouseBasic]
  
  var body: some View {
    NavigationView {
      Group {
        if houses.isEmpty {
          Text("Loading")
        } else {
          List {
            ForEach(houses) { house in
              Text("\(house.name)")
            }
          }
        }
      }
      .navigationTitle("All Houses of Westeros")
    }
    .accentColor(.red)
  }
}

struct AllHousesDisplay_Previews: PreviewProvider {
  static var previews: some View {
    AllHousesDisplay(
      houses: MockClasses.housesBasic
    )
  }
}
