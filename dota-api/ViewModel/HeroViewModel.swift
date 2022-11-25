//
//  HeroViewModel.swift
//  dota-api
//
//  Created by Candra Winardi on 26/11/22.
//

import Foundation
import SwiftUI

class HeroViewModel: ObservableObject{
    func filterAndSortHeros(filter: String, sort: String, heros: [heroModel]) -> [heroModel]{
        let filteredHeros = filterHeros(text: filter, heros: heros)
        let sortedHeros = sortHeros(text: sort, heros: filteredHeros)
        return sortedHeros
    }
    
    private func filterHeros(text: String, heros: [heroModel]) -> [heroModel]{
        if (text.isEmpty || text == "All"){
            return heros
        } else{
            return heros.filter{ $0.roles.contains(text) }
        }
    }

    private func sortHeros(text: String, heros: [heroModel]) -> [heroModel]{
        switch text{
        case "Base Attack (Lower Limit)":
            return heros.sorted{ $0.baseAttackMin < $1.baseAttackMin }
        case "Base Health":
            return heros.sorted{ $0.baseHealth < $1.baseHealth }
        case "Base Mana":
            return heros.sorted{ $0.baseMana < $1.baseMana }
        case "Base Speed":
            return heros.sorted{ $0.moveSpeed < $1.moveSpeed }
        default:
            return heros
        }
    }
}
