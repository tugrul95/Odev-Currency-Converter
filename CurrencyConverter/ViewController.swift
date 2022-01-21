//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Macbook on 18.01.2022
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var ratesTableView: UITableView!
    
    let dataSource = CurrencyDataSource()

    lazy var viewModel: CurrencyViewModel = {
        let viewModel = CurrencyViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupUI()
    }
    
    private func setupUI() {
        self.title = "Euro Exchange Rates"
        
        self.ratesTableView.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.ratesTableView.reloadData()
        }

        // add error handling example
        self.viewModel.onErrorHandling = { [weak self] _ in
            // display error ?
            let controller = UIAlertController(title: "An error occured", message: "Oops, something went wrong!", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            self?.present(controller, animated: true, completion: nil)
        }

        self.viewModel.fetchCurrencies()
    }
}
