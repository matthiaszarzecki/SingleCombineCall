//
//  HouseBasic.swift
//  SingleCombineCall
//
//  Created by Matthias Zarzecki on 11.05.21.
//

import Foundation

/// Contains all data related to a House in ASOIAF.
struct HouseBasic: Codable, Identifiable, Hashable {
  let id = UUID()
  
  let url: String
  let name: String
  let region: String
  let coatOfArms: String
  let motto: String
  let titles: [String]
  let seats: [String]
  let foundingPeriod: String
  let diedOutPeriod: String
  let ancestralWeapons: [String]

  // When assigned these fields are URL's as strings.
  let currentLord: String
  let heir: String
  let overlordHouse: String
  let foundedByCharacter: String
  let cadetBranches: [String]
  let swornMembers: [String]
  
  enum CodingKeys: String, CodingKey {
    case url
    case name
    case region
    case coatOfArms
    case motto = "words"
    case titles
    case seats
    case currentLord
    case heir
    case overlordHouse = "overlord"
    case foundingPeriod = "founded"
    case foundedByCharacter = "founder"
    case diedOutPeriod = "diedOut"
    case ancestralWeapons
    case cadetBranches
    case swornMembers
  }
}
