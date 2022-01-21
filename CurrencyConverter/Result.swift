//
//  CurrencyService.swift
//  CurrencyConverter
//
//  Created by Macbook on 18.01.2022
//

import Foundation

enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}
