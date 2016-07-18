//
//  Constants.swift
//  pokemonTracker
//
//  Created by Leandro on 7/16/16.
//  Copyright © 2016 asleepinthetrees. All rights reserved.
//

import Foundation
import MapKit

struct Constants {

// MARK: constants
static let regionRadius: CLLocationDistance = 100 // region radius can be thought of as map zoom
static let initialLocation : CLLocation = CLLocation(latitude: 41.826820, longitude: -71.402931)

// MARK: constants for VCMapView
static let pinImageSize = CGSize(width: 50, height: 50)
static let pinCalloutOffset = CGPoint(x: -5, y: 5)


}

public enum PokemonType : String {
    case Bulbasaur, Ivysaur, Venusaur,
        Charmander, Charmeleon, Charizard,
        Squirtle, Wartortle, Blastoise,
        Caterpie, Metapod, Butterfree,
        Weedle, Kakuna, Beedrill,
        Pidgey, Pidgeotto, Pidgeot,
        Rattata, Raticate,
        Spearow, Fearow,
        Ekans, Arbok,
        Pikachu, Raichu,
        Sandshrew, Sandslash,
        Nidoranf = "Nidoran (f)" , Nidorina, Nidoqueen,
        Nidoranm = "Nidoran (m)", Nidorino, Nidoking,
        Clefairy, Clefable,
        Vulpix, Ninetales,
        Jigglypuff, Wigglytuff,
        Zubat, Golbat,
        Oddish, Gloom, Vileplume,
        Paras, Parasect,
        Venonat, Venomoth,
        Diglett, Dugtrio,
        Meowth, Persian,
        Psyduck, Golduck,
        Mankey, Primeape,
        Growlithe, Arcanine,
        Poliwag, Poliwhirl, Poliwrath,
        Abra, Kadabra, Alakazam,
        Machop, Machoke, Machamp,
        Bellsprout, Weepinbell, Victreebel,
        Tentacool, Tentacruel,
        Geodude, Graveler, Golem,
        Ponyta, Rapidash,
        Slowpoke, Slowbro,
        Magnemite, Magneton,
        FarFetchd = "FarFetch'd",
        DoDuo, Dodrio,
        Seel, Dewgong,
        Grimer, Muk,
        Shellder, Cloyster,
        Gastly, Haunter, Gengar,
        Onix,
        Drowzee, Hypno,
        Krabby, Kingler,
        Voltorb, Electrode,
        Exeggcute, Exeggutor,
        Cubone, Marowak,
        Hitmonlee,
        Hitmonchan,
        Lickitung,
        Koffing, Weezing,
        Rhyhorn, Rhydon,
        Chansey,
        Tangela,
        Kangaskhan,
        Horsea,
        Seadra,
        Goldeen, Seaking,
        Staryu, Starmie,
        MrMime = "Mr. Mime",
        Scyther,
        Jynx,
        Electabuzz,
        Magmar,
        Pinsir,
        Tauros,
        Magikarp, Gyarados,
        Lapras,
        Ditto,
        Eevee, Flareon, Vaporeon, Jolteon,
        Porygon,
        Omanyte, Omastar,
        Kabuto, Kabutops,
        Aerodactyl,
        Snorlax,
        Articuno,
        Zapdos,
        Moltres,
        Dratini, Dragonair, Dragonite,
        Mewtwo
    
    
    
    
    var image: UIImage {
        switch self {
        case .Bulbasaur: return UIImage(named: "Bulbasaur")!
        case .Ivysaur: return UIImage(named: "Ivysaur")!
        case .Venusaur: return UIImage(named: "Venusaur")!
        case .Charmander: return UIImage(named: "Charmander")!
        case .Charmeleon: return UIImage(named: "Charmeleon")!
        case .Charizard: return UIImage(named: "Charizard")!
        case .Squirtle: return UIImage(named: "Squirtle")!
        case .Wartortle: return UIImage(named: "Wartortle")!
        case .Blastoise: return UIImage(named: "Blastoise")!
        case .Caterpie: return UIImage(named: "Caterpie")!
        case .Metapod: return UIImage(named: "Metapod")!
        case .Butterfree: return UIImage(named: "Butterfree")!
        case .Weedle: return UIImage(named: "Weedle")!
        case .Kakuna: return UIImage(named: "Kakuna")!
        case .Beedrill: return UIImage(named: "Beedrill")!
        case .Pidgey: return UIImage(named: "Pidgey")!
        case .Pidgeotto: return UIImage(named: "Pidgeotto")!
        case .Pidgeot: return UIImage(named: "Pidgeot")!
        case .Rattata: return UIImage(named: "Rattata")!
        case .Raticate: return UIImage(named: "Raticate")!
        case .Spearow: return UIImage(named: "Spearow")!
        case .Fearow: return UIImage(named: "Fearow")!
        case .Ekans: return UIImage(named: "Ekans")!
        case .Arbok: return UIImage(named: "Arbok")!
        case .Pikachu: return UIImage(named: "Pikachu")!
        case .Raichu: return UIImage(named: "Raichu")!
        case .Sandshrew: return UIImage(named: "Sandshrew")!
        case .Sandslash: return UIImage(named: "Sandslash")!
        case .Nidoranf: return UIImage(named: "Nidoranf")!
        case .Nidorina: return UIImage(named: "Nidorina")!
        case .Nidoqueen: return UIImage(named: "Nidoqueen")!
        case .Nidoranm: return UIImage(named: "Nidoranm")!
        case .Nidorino: return UIImage(named: "Nidorino")!
        case .Nidoking: return UIImage(named: "Nidoking")!
        case .Clefairy: return UIImage(named: "Clefairy")!
        case .Clefable: return UIImage(named: "Clefable")!
        case .Vulpix: return UIImage(named: "Vulpix")!
        case .Ninetales: return UIImage(named: "Ninetales")!
        case .Jigglypuff: return UIImage(named: "Jigglypuff")!
        case .Wigglytuff: return UIImage(named: "Wigglytuff")!
        case .Zubat: return UIImage(named: "Zubat")!
        case .Golbat: return UIImage(named: "Golbat")!
        case .Oddish: return UIImage(named: "Oddish")!
        case .Gloom: return UIImage(named: "Gloom")!
        case .Vileplume: return UIImage(named: "Vileplume")!
        case .Paras: return UIImage(named: "Paras")!
        case .Parasect: return UIImage(named: "Parasect")!
        case .Venonat: return UIImage(named: "Venonat")!
        case .Venomoth: return UIImage(named: "Venomoth")!
        case .Diglett: return UIImage(named: "Diglett")!
        case .Dugtrio: return UIImage(named: "Dugtrio")!
        case .Meowth: return UIImage(named: "Meowth")!
        case .Persian: return UIImage(named: "Persian")!
        case .Psyduck: return UIImage(named: "Psyduck")!
        case .Golduck: return UIImage(named: "Golduck")!
        case .Mankey: return UIImage(named: "Mankey")!
        case .Primeape: return UIImage(named: "Primeape")!
        case .Growlithe: return UIImage(named: "Growlithe")!
        case .Arcanine: return UIImage(named: "Arcanine")!
        case .Poliwag: return UIImage(named: "Poliwag")!
        case .Poliwhirl: return UIImage(named: "Poliwhirl")!
        case .Poliwrath: return UIImage(named: "Poliwrath")!
        case .Abra: return UIImage(named: "Abra")!
        case .Kadabra: return UIImage(named: "Kadabra")!
        case .Alakazam: return UIImage(named: "Alakazam")!
        case .Machop: return UIImage(named: "Machop")!
        case .Machoke: return UIImage(named: "Machoke")!
        case .Machamp: return UIImage(named: "Machamp")!
        case .Bellsprout: return UIImage(named: "Bellsprout")!
        case .Weepinbell: return UIImage(named: "Weepinbell")!
        case .Victreebel: return UIImage(named: "Victreebel")!
        case .Tentacool: return UIImage(named: "Tentacool")!
        case .Tentacruel: return UIImage(named: "Tentacruel")!
        case .Geodude: return UIImage(named: "Geodude")!
        case .Graveler: return UIImage(named: "Graveler")!
        case .Golem: return UIImage(named: "Golem")!
        case .Ponyta: return UIImage(named: "Ponyta")!
        case .Rapidash: return UIImage(named: "Rapidash")!
        case .Slowpoke: return UIImage(named: "Slowpoke")!
        case .Slowbro: return UIImage(named: "Slowbro")!
        case .Magnemite: return UIImage(named: "Magnemite")!
        case .Magneton: return UIImage(named: "Magneton")!
        case .FarFetchd: return UIImage(named: "FarFetchd")!
        case .DoDuo: return UIImage(named: "DoDuo")!
        case .Dodrio: return UIImage(named: "Dodrio")!
        case .Seel: return UIImage(named: "Seel")!
        case .Dewgong: return UIImage(named: "Dewgong")!
        case .Grimer: return UIImage(named: "Grimer")!
        case .Muk: return UIImage(named: "Muk")!
        case .Shellder: return UIImage(named: "Shellder")!
        case .Cloyster: return UIImage(named: "Cloyster")!
        case .Gastly: return UIImage(named: "Gastly")!
        case .Haunter: return UIImage(named: "Haunter")!
        case .Gengar: return UIImage(named: "Gengar")!
        case .Onix: return UIImage(named: "Onix")!
        case .Drowzee: return UIImage(named: "Drowzee")!
        case .Hypno: return UIImage(named: "Hypno")!
        case .Krabby: return UIImage(named: "Krabby")!
        case .Kingler: return UIImage(named: "Kingler")!
        case .Voltorb: return UIImage(named: "Voltorb")!
        case .Electrode: return UIImage(named: "Electrode")!
        case .Exeggcute: return UIImage(named: "Exeggcute")!
        case .Exeggutor: return UIImage(named: "Exeggutor")!
        case .Cubone: return UIImage(named: "Cubone")!
        case .Marowak: return UIImage(named: "Marowak")!
        case .Hitmonlee: return UIImage(named: "Hitmonlee")!
        case .Hitmonchan: return UIImage(named: "Hitmonchan")!
        case .Lickitung: return UIImage(named: "Lickitung")!
        case .Koffing: return UIImage(named: "Koffing")!
        case .Weezing: return UIImage(named: "Weezing")!
        case .Rhyhorn: return UIImage(named: "Rhyhorn")!
        case .Rhydon: return UIImage(named: "Rhydon")!
        case .Chansey: return UIImage(named: "Chansey")!
        case .Tangela: return UIImage(named: "Tangela")!
        case .Kangaskhan: return UIImage(named: "Kangaskhan")!
        case .Horsea: return UIImage(named: "Horsea")!
        case .Seadra: return UIImage(named: "Seadra")!
        case .Goldeen: return UIImage(named: "Goldeen")!
        case .Seaking: return UIImage(named: "Seaking")!
        case .Staryu: return UIImage(named: "Staryu")!
        case .Starmie: return UIImage(named: "Starmie")!
        case .MrMime: return UIImage(named: "MrMime")!
        case .Scyther: return UIImage(named: "Scyther")!
        case .Jynx: return UIImage(named: "Jynx")!
        case .Electabuzz: return UIImage(named: "Electabuzz")!
        case .Magmar: return UIImage(named: "Magmar")!
        case .Pinsir: return UIImage(named: "Pinsir")!
        case .Tauros: return UIImage(named: "Tauros")!
        case .Magikarp: return UIImage(named: "Magikarp")!
        case .Gyarados: return UIImage(named: "Gyarados")!
        case .Lapras: return UIImage(named: "Lapras")!
        case .Ditto: return UIImage(named: "Ditto")!
        case .Eevee: return UIImage(named: "Eevee")!
        case .Flareon: return UIImage(named: "Flareon")!
        case .Vaporeon: return UIImage(named: "Vaporeon")!
        case .Jolteon: return UIImage(named: "Jolteon")!
        case .Porygon: return UIImage(named: "Porygon")!
        case .Omanyte: return UIImage(named: "Omanyte")!
        case .Omastar: return UIImage(named: "Omastar")!
        case .Kabuto: return UIImage(named: "Kabuto")!
        case .Kabutops: return UIImage(named: "Kabutops")!
        case .Aerodactyl: return UIImage(named: "Aerodactyl")!
        case .Snorlax: return UIImage(named: "Snorlax")!
        case .Articuno: return UIImage(named: "Articuno")!
        case .Zapdos: return UIImage(named: "Zapdos")!
        case .Moltres: return UIImage(named: "Moltres")!
        case .Dratini: return UIImage(named: "Dratini")!
        case .Dragonair: return UIImage(named: "Dragonair")!
        case .Dragonite: return UIImage(named: "Dragonite")!
        case .Mewtwo: return UIImage(named: "Mewtwo")!
        }
    }
    
    static let allValues = [Bulbasaur, Ivysaur, Venusaur,
                            Charmander, Charmeleon, Charizard,
                            Squirtle, Wartortle, Blastoise,
                            Caterpie, Metapod, Butterfree,
                            Weedle, Kakuna, Beedrill,
                            Pidgey, Pidgeotto, Pidgeot,
                            Rattata, Raticate,
                            Spearow, Fearow,
                            Ekans, Arbok,
                            Pikachu, Raichu,
                            Sandshrew, Sandslash,
                            Nidoranf, Nidorina, Nidoqueen,
                            Nidoranm, Nidorino, Nidoking,
                            Clefairy, Clefable,
                            Vulpix, Ninetales,
                            Jigglypuff, Wigglytuff,
                            Zubat, Golbat,
                            Oddish, Gloom, Vileplume,
                            Paras, Parasect,
                            Venonat, Venomoth,
                            Diglett, Dugtrio,
                            Meowth, Persian,
                            Psyduck, Golduck,
                            Mankey, Primeape,
                            Growlithe, Arcanine,
                            Poliwag, Poliwhirl, Poliwrath,
                            Abra, Kadabra, Alakazam,
                            Machop, Machoke, Machamp,
                            Bellsprout, Weepinbell, Victreebel,
                            Tentacool, Tentacruel,
                            Geodude, Graveler, Golem,
                            Ponyta, Rapidash,
                            Slowpoke, Slowbro,
                            Magnemite, Magneton,
                            FarFetchd,
                            DoDuo, Dodrio,
                            Seel, Dewgong,
                            Grimer, Muk,
                            Shellder, Cloyster,
                            Gastly, Haunter, Gengar,
                            Onix,
                            Drowzee, Hypno,
                            Krabby, Kingler,
                            Voltorb, Electrode,
                            Exeggcute, Exeggutor,
                            Cubone, Marowak,
                            Hitmonlee,
                            Hitmonchan,
                            Lickitung,
                            Koffing, Weezing,
                            Rhyhorn, Rhydon,
                            Chansey,
                            Tangela,
                            Kangaskhan,
                            Horsea,
                            Seadra,
                            Goldeen, Seaking,
                            Staryu, Starmie,
                            MrMime,
                            Scyther,
                            Jynx,
                            Electabuzz,
                            Magmar,
                            Pinsir,
                            Tauros,
                            Magikarp, Gyarados,
                            Lapras,
                            Ditto,
                            Eevee, Flareon, Vaporeon, Jolteon,
                            Porygon,
                            Omanyte, Omastar,
                            Kabuto, Kabutops,
                            Aerodactyl,
                            Snorlax,
                            Articuno,
                            Zapdos,
                            Moltres,
                            Dratini, Dragonair, Dragonite,
                            Mewtwo]

}