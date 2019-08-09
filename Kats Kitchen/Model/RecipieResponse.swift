//
//  RecipieResponse.swift
//  Kats Kitchen
//
//  Created by Eli Warner on 8/8/19.
//  Copyright © 2019 EGW. All rights reserved.
//

import Foundation

struct RecipieResponse: Codable {
    var q: String
    var from: Int
    var params: Params
    var more: Bool
    var count: Float
    var hits: [Hits]
}

struct Params: Codable{
    var sane: [String]
    var q: [String]
    var app_key: [String]
    var app_id: [String]
}
struct Hits: Codable {
    var recipe: Recipe
}

struct Recipe: Codable {
    var uri: URL
    var label: String
    var image: URL
    var source: String
    var url: URL
    var shareAs: URL
    var yield: Float
    
    var dietLabels: [String]
    var healthLabels: [String]
    var cautions: [String]
    
    var ingredientLines: [String]
    
    var ingredients: [Ingredients]
    var calories: Double
    var totalWeight: Double
    var totalTime: Float
    var totalNutrients: TotalNutrients
    var totalDaily: TotalDaily
    var digest: [Digest]
    var bookmarked: Bool
    var bought: Bool
    
}

struct TotalNutrients: Codable {
    var ENERC_KCAL: Nutrient
    var FAT: Nutrient
    var FASAT: Nutrient
    var FATRN: Nutrient
    var FAMS: Nutrient
    var FAPU: Nutrient
    var CHOCDF: Nutrient
    var FIBTG: Nutrient
    var SUGAR: Nutrient
    var PROCNT: Nutrient
    var CHOLE: Nutrient
    var NA: Nutrient
    var CA: Nutrient
    var MG: Nutrient
    var K: Nutrient
    var FE: Nutrient
    var ZN: Nutrient
    var P: Nutrient
    var VITA_RAE: Nutrient
    var VITC: Nutrient
    var THIA: Nutrient
    var RIBF: Nutrient
    var NIA: Nutrient
    var VITB6A: Nutrient
    var FOLDFE: Nutrient
    var FOLFD: Nutrient
    var VITB12: Nutrient
    var VITD: Nutrient
    var TOCPHA: Nutrient
    var VITK1: Nutrient
}

struct TotalDaily: Codable {
    var ENERC_KCAL: Nutrient
    var FAT: Nutrient
    var FASAT: Nutrient
    var CHOCDF: Nutrient
    var FIBTG: Nutrient
    var PROCNT: Nutrient
    var CHOLE: Nutrient
    var NA: Nutrient
    var CA: Nutrient
    var MG: Nutrient
    var K: Nutrient
    var FE: Nutrient
    var ZN: Nutrient
    var P: Nutrient
    var VITA_RAE: Nutrient
    var VITC: Nutrient
    var THIA: Nutrient
    var RIBF: Nutrient
    var NIA: Nutrient
    var VITB6A: Nutrient
    var FOLDFE: Nutrient
    var VITB12: Nutrient
    var VITD: Nutrient
    var TOCPHA: Nutrient
    var VITK1: Nutrient
}

struct Nutrient: Codable {
    var label: String
    var quantity: Double
    var unit: String
}

struct Digest: Codable {
    var label: String
    var tag: String
    var schemaOrgTag: String?
    var total: Double
    var hasRDI: Bool
    var daily: Double
    var unit: String
    var sub: [Sub]?
}

struct Sub: Codable {
    var label: String
    var tag: String
    var schemaOrgTag: String
    var total: Double
    var hasRDI: Bool
    var daily: Double
    var unit: String
}

struct Ingredients: Codable {
    var text: String
    var weight: Float
}
