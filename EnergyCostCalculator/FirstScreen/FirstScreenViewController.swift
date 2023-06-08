//
//  FirstScreenViewController.swift
//  EnergyCostCalculator
//
//  Created by Enes Ketencioglu on 8.06.2023.
//  
//

import UIKit

class FirstScreenViewController: BaseViewController,FirstScreenViewProtocol {
    var presenter: FirstScreenPresenter?
    
    @IBOutlet weak var serviceNumber: UITextField!
    @IBOutlet weak var currentMeter: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapSubmit(_ sender: Any) {
        showLoadingAnimation()
        guard let serviceNumber = self.serviceNumber.text else {
            return
        }
        var currentMeter: Int?
        if let meterText = self.currentMeter.text, let meterValue = Int(meterText) {
            currentMeter = meterValue
        }
        presenter?.submitClicked(serviceNumber: serviceNumber, currentMeter: currentMeter)
    }
    override func viewDidDisappear(_ animated: Bool) {
        serviceNumber.text = ""
        currentMeter.text = ""
    }
    
    
    func showServiceAlert() {
        hideLoadingAnimation()
        let alertController = UIAlertController(title: "Invalid ServiceNumber", message: "Please enter 10 digit service number!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func showMeterAlert() {
        hideLoadingAnimation()
        let alertController = UIAlertController(title: "Invalid input", message: "Do not enter a negative value or a value smaller than the previous counter value, last value is", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func showMeterAlert(lastRead:Int) {
        hideLoadingAnimation()
        let alertController = UIAlertController(title: "Invalid input", message: "Do not enter a negative value or a value smaller than the previous counter value, last value is \(lastRead)!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    
}
