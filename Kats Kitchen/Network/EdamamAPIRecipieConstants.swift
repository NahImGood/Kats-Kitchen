//
//  File.swift
//  Kats Kitchen
//
//  Created by Eli Warner on 7/1/19.
//  Copyright © 2019 EGW. All rights reserved.
//

import Foundation

class RecipieConstants {
    
    enum Required: String {
        case apiKey = "api_key"
        case apiID = "api_id"
    }
    
    enum Search: String {
        //Query text. For example q=chicken. This or the r parameter are required
        case query = "q"
        //Returns information about a specific recipe based on its ID ie. r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_9b5945e03f05acbf9d69625138385408 This or the q parameter are required
        case returnParam = "r"
    }
}
