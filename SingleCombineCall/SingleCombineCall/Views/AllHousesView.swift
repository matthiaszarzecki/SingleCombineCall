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
  }
}

struct AllHousesDisplay: View {
  let houses: [HouseBasic]
  
  var body: some View {
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
}

struct AllHousesDisplay_Previews: PreviewProvider {
  static var previews: some View {
    AllHousesDisplay(
      houses: [
        HouseBasic(name: "House Stark"),
        HouseBasic(name: "House Targaryen"),
        HouseBasic(name: "House Lannister"),
        HouseBasic(name: "House Arryn")
      ]
    )
    
    AllHousesDisplay(
      houses: []
    )
  }
}
