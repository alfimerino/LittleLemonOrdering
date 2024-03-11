//
//  MenuItem.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/10/24.
//

import Foundation

struct MenuItem: Decodable {
    let title: String
    let image: String
    let price: String
    let category: String
    let description: String
}
