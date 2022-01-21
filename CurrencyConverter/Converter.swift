//
//  Converter.swift
//  CurrencyConverter
//
//  Created by Macbook on 18.01.2022
//

import Foundation

struct Converter: Decodable {
    
    let base: String
    let date: String
    
    let rates: [ExchangeRate]
    
    enum CodingKeys: String, CodingKey {
          case base, date, rates
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.base = try values.decode(String.self, forKey: .base)
        self.date = try values.decode(String.self, forKey: .date)
        let dictionary = try values.decode([String: Double].self, forKey: .rates)
        
        self.rates = dictionary.map { key, value in
            ExchangeRate(currencyIso: key, rate: value)
        }
    }
}

struct ExchangeRate {
    
    let currencyIso: String
    let rate: Double
}
