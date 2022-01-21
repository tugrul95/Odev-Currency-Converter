//
//  CurrencyService.swift
//  CurrencyConverter
//
//  Created by Macbook on 18.01.2022
//

import Foundation

protocol CurrencyServiceProtocol: AnyObject {
    func fetchConverter(_ completion: @escaping ((Result<Converter, ErrorResult>) -> Void))
}

final class CurrencyService: RequestHandler, CurrencyServiceProtocol {
    
    static let shared = CurrencyService()
    
    let endpoint = "http://data.fixer.io/api/latest?access_key=44fdb7973a2d4dd09a0d55e0a7039d04&format=1"
    var task: URLSessionTask?
    
    func fetchConverter(_ completion: @escaping ((Result<Converter, ErrorResult>) -> Void)) {
        
        // cancel previous request if already in progress
        self.cancelFetchCurrencies()
        
        task = RequestService().loadData(urlString: endpoint, completion: self.networkResult(completion: completion))
    }
    
    func cancelFetchCurrencies() {
        
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}
