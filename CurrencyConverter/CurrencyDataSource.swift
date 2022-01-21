//
//  CurrencyService.swift
//  CurrencyConverter
//
//  Created by Macbook on 18.01.2022
//

import Foundation
import UIKit

class GenericDataSource<T>: NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class CurrencyDataSource: GenericDataSource<ExchangeRate>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as? CurrencyCell else {
            fatalError("CurrencyCell not found")
        }
        
        let currencyRate = self.data.value[indexPath.row]
        cell.currencyRate = currencyRate
        
        return cell
    }
}
