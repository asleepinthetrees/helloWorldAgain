//
//  PokemonDataStore.swift
//  pokemonTracker
//
//  Created by Luke Murray on 7/17/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import Foundation

class PokemonDataStore {
    private let pokemons = ["Vanilla", "Chocolate", "Strawberry", "Coffee", "Cookies & Cream", "Rum Raisins", "Mint Chocolate Chip", "Peanut Butter Cup"]
    
    func allPokemons() -> [String]
    {
        return pokemons
    }
}