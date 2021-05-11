//
//  Data-Extension.swift
//  SingleCombineCall
//
//  Created by Matthias Zarzecki on 11.05.21.
//

import Foundation

extension Data {
  func printJsonFromData() {
    print("JSON String: \(String(data: self, encoding: .utf8) ?? "")")
  }
}
