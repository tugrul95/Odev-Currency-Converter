//
//  CurrencyService.swift
//  CurrencyConverter
//
//  Created by Macbook on 18.01.2022
//
import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
