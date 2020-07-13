//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Yiheng Quan on 13/7/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel: Codable {
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
