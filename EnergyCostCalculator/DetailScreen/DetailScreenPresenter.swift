//
//  DetailScreenPresenter.swift
//  EnergyCostCalculator
//
//  Created by Enes Ketencioglu on 8.06.2023.
//  
//

import Foundation
import CoreData
import UIKit

class DetailScreenPresenter: DetailScreenPresenterProtocol {
    
    /*
     
     Consumption         Rate
     1-100 units         @ $5 / unit
     101 – 500 units     @ $8 / unit
     > 500 units         @ $10 / unit
     
     */
    
    private let firstCons: (Int, Int)
    private let secondCons: (Int, Int)
    init() {
        let firstConsValue = (100, 5)                // change value for 1. unit rate. (100 -> 200 , 5 -> 6) etc.
        firstCons = firstConsValue
        secondCons = ((500 - firstConsValue.0), 8)   // change value for 1. unit rate  (500 -> 300 , 8 -> 7) etc.
    }
    private let thirdCons = 10                       // change value for 3. unit rate  (10 -> 15) etc.

    
    
    var view: DetailScreenViewController?
    var interactor: DetailScreenInteractor?
    var router: DetailScreenRouter?
    
    private var currentMeter:Int?
    private var serviceNumber:String?
    private var invoiceValue:Double?
    private var bills:[ElectricityData]?
    
    func saveBill() {
        interactor?.saveElectricityData(customerID: serviceNumber!, lastReadings: Int32(currentMeter!), invoiceValue: invoiceValue!)
        self.view!.dismiss(animated: true, completion: nil)
    }
    
    func calculateCost(units: Int) -> String {
        var currentUnit = units
        if let lastData = bills?.last?.lastReadings{
            currentUnit = (units - Int(lastData))
        }
        
        var totalBill: Double = 0.0
        var remainingUnits = currentUnit
        
        let firstSlabUnits = min(100, remainingUnits)
        totalBill += Double(firstSlabUnits) * Double(firstCons.1)
        remainingUnits -= firstSlabUnits
        
        let secondSlabUnits = min(400, remainingUnits)
        totalBill += Double(secondSlabUnits) * Double(secondCons.1)
        remainingUnits -= secondSlabUnits
        
        if remainingUnits > 0 {
            totalBill += Double(remainingUnits) * Double(thirdCons)
        }
        self.invoiceValue = totalBill
        return String(totalBill)
    }
    
    func fetchData(currentMeter:Int,serviceNumber:String) {
        self.currentMeter = currentMeter
        self.serviceNumber = serviceNumber
        
        self.bills = interactor?.fetchDataForSeviceNumber(serviceNumber)
        view?.lastCosts = bills?.reversed()
    }
}

