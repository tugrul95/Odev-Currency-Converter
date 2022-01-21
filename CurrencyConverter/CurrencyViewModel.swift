//
//  CurrencyService.swift
//  CurrencyConverter
//
//  Created by Macbook on 18.01.2022
//

import Foundation

struct CurrencyViewModel {
    
    weak var dataSource: GenericDataSource<ExchangeRate>?
    weak var service: CurrencyServiceProtocol?
    
    var onErrorHandling: ((ErrorResult?) -> Void)?
    
    init(service: CurrencyServiceProtocol = CurrencyService.shared, dataSource: GenericDataSource<ExchangeRate>?) {
        self.dataSource = dataSource
        self.service = service
    }
    
    func fetchCurrencies() {
        
        guard let service = service else {
            onErrorHandling?(ErrorResult.custom(string: "Missing service"))
            return
        }
        
        service.fetchConverter { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let converter) :
                    self.dataSource?.data.value = converter.rates
                case .failure(let error) :
                    self.onErrorHandling?(error)
                }
            }
        }
    }
}
