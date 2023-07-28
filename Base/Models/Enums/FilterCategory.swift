//
//  FilterCategory.swift
//  Landmarks
//
//  Created by Kevin Marin on 28/7/23.
//

import Foundation

enum FilterCategory: String, CaseIterable, Identifiable {
    case all = "All"
    case lakes = "Lakes"
    case rivers = "Rivers"
    case mountains = "Mountains"

    var id: FilterCategory { self }
}
