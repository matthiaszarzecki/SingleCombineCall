//
//  HouseBasic.swift
//  SingleCombineCall
//
//  Created by Matthias Zarzecki on 11.05.21.
//

import Foundation

struct HouseBasic: Codable, Identifiable, Hashable {
  let id = UUID()
  let name: String
}
