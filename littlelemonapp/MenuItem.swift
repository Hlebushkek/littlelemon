//
//  MenuItem.swift
//  littlelemonapp
//
//  Created by Hlib Sobolevskyi on 2024-07-05.
//

import Foundation

struct JSONMenu: Codable {
    let menu: [MenuItem]
}

struct MenuItem: Codable {
    let title: String
    let price: String
    let description: String
    let image: String
    let category: String
}
