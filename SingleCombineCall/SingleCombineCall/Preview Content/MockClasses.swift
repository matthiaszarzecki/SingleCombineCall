//
//  MockClasses.swift
//  SingleCombineCall
//
//  Created by Matthias Zarzecki on 11.05.21.
//

import Foundation

struct MockClasses {
  static let idGreatHouse = 17
  
  static let characterLink = "https://www.anapioficeandfire.com/api/characters/298"
  static let houseLink = "https://www.anapioficeandfire.com/api/houses/285"
  
  static let houseName = "House Goodbrother of Crow Spike Keep"
  static let houseRegion = "Dorne"
  static let coatOfArms = "Gyronny Gules and Sable, a hand couped Or"
  static let motto = "No Foe May Pass"
  static let titles = [
    "King of Mountain and Vale (formerly)",
    "Lord of the Eyrie",
    "Defender of the Vale",
    "Warden of the East"
  ]
  static let seats = [
    "Godsgrace",
    "Gates of the Moon (winter)"
  ]
  static let foundingPeriod = "Coming of the Andals"
  static let diedOutPeriod = "260 AC"
  static let ancestralWeapons = [
    "Blackfyre",
    "Whitefyre"
  ]
  
  static let houseBasicWithLinksAndWithCoatOfArms = HouseBasic(
    url: "https://www.anapioficeandfire.com/api/house/7",
    name: houseName,
    region: houseRegion,
    coatOfArms: coatOfArms,
    motto: motto,
    titles: titles,
    seats: seats,
    foundingPeriod: foundingPeriod,
    diedOutPeriod: diedOutPeriod,
    ancestralWeapons: ancestralWeapons,
    currentLord: characterLink,
    heir: characterLink,
    overlordHouse: houseLink,
    foundedByCharacter: characterLink,
    cadetBranches: Array.init(repeating: houseLink, count: 2),
    swornMembers: Array.init(repeating: characterLink, count: 4)
  )
  
  static let houseBasicWithLinksAndWithoutCoatOfArms = HouseBasic(
    url: "https://www.anapioficeandfire.com/api/house/17",
    name: houseName,
    region: houseRegion,
    coatOfArms: "",
    motto: motto,
    titles: titles,
    seats: seats,
    foundingPeriod: foundingPeriod,
    diedOutPeriod: diedOutPeriod,
    ancestralWeapons: ancestralWeapons,
    currentLord: characterLink,
    heir: characterLink,
    overlordHouse: houseLink,
    foundedByCharacter: characterLink,
    cadetBranches: Array.init(repeating: houseLink, count: 2),
    swornMembers: Array.init(repeating: characterLink, count: 4)
  )
  
  static let houseBasicWithoutLinksAndWithCoatOfArms = HouseBasic(
    url: "https://www.anapioficeandfire.com/api/house/292",
    name: houseName,
    region: houseRegion,
    coatOfArms: coatOfArms,
    motto: motto,
    titles: titles,
    seats: seats,
    foundingPeriod: foundingPeriod,
    diedOutPeriod: diedOutPeriod,
    ancestralWeapons: ancestralWeapons,
    currentLord: "",
    heir: "",
    overlordHouse: "",
    foundedByCharacter: "",
    cadetBranches: [],
    swornMembers: []
  )
  
  static let houseBasicWithoutLinksAndWithoutCoatOfArms = HouseBasic(
    url: "https://www.anapioficeandfire.com/api/house/293",
    name: houseName,
    region: houseRegion,
    coatOfArms: "",
    motto: motto,
    titles: titles,
    seats: seats,
    foundingPeriod: foundingPeriod,
    diedOutPeriod: diedOutPeriod,
    ancestralWeapons: ancestralWeapons,
    currentLord: "",
    heir: "",
    overlordHouse: "",
    foundedByCharacter: "",
    cadetBranches: [],
    swornMembers: []
  )
  
  static let housesBasic = [
    houseBasicWithLinksAndWithCoatOfArms,
    houseBasicWithLinksAndWithoutCoatOfArms,
    houseBasicWithoutLinksAndWithCoatOfArms,
    houseBasicWithoutLinksAndWithoutCoatOfArms
  ]
}
