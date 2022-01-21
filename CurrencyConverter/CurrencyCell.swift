//
//  CurrencyService.swift
//  CurrencyConverter
//
//  Created by Macbook on 18.01.2022
//

import UIKit

class CurrencyCell: UITableViewCell {

    @IBOutlet private weak var currencyLabel: UILabel!
    @IBOutlet private weak var rateLabel: UILabel!
    
    var currencyRate: ExchangeRate? {
        didSet {
            
            guard let currencyRate = currencyRate else {
                return
            }
            
            rateLabel?.text = "\(currencyRate.rate)"
            currencyLabel?.text = currencyRate.currencyIso
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
