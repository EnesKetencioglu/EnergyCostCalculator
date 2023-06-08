//
//  DetailScreenViewController.swift
//  EnergyCostCalculator
//
//  Created by Enes Ketencioglu on 8.06.2023.
//  
//

import UIKit

class DetailScreenViewController: BaseViewController,DetailScreenViewProtocol {
    
    var presenter: DetailScreenPresenter?
    var currentMeter:Int?
    var serviceNumber:String?
    @IBOutlet weak var costLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var lastCosts : [ElectricityData]?{
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "BillCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BillCell")
        tableView.dataSource = self
        tableView.delegate = self
        presenter?.fetchData(currentMeter: currentMeter!, serviceNumber: serviceNumber!)
        showCost()
        
    }
    func showCost(){
        self.costLabel.text = "\(presenter?.calculateCost(units: currentMeter!) ?? "0.0") $"
    }

    @IBAction func didTapSaveButton(_ sender: Any) {
        presenter?.saveBill()
    }
    
}
extension DetailScreenViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BillCell",for: indexPath) as! BillCell
        cell.title.text = String((self.lastCosts?[indexPath.row].lastReadings)!)
        cell.cost.text = String((self.lastCosts?[indexPath.row].invoiceValue)!)
        return cell
    }
    
    
}
