//
//  DetailScreenContract.swift
//  EnergyCostCalculator
//
//  Created by Enes Ketencioglu on 8.06.2023.
//  
//

import Foundation
import UIKit


protocol DetailScreenViewProtocol: AnyObject  {
    
}

protocol DetailScreenPresenterProtocol: AnyObject  {
    
    var view: DetailScreenViewController? { get set }
    var interactor: DetailScreenInteractor? { get set }
    var router: DetailScreenRouter? { get set }
    func fetchData(currentMeter:Int,serviceNumber:String)
    func calculateCost(units: Int) -> String
    func saveBill()

}

protocol DetailScreenInteractorProtocol: AnyObject  {
    func fetchDataForSeviceNumber(_ seviceNumber: String) -> [ElectricityData]
    func saveElectricityData(customerID: String, lastReadings: Int32, invoiceValue: Double)
    
}

protocol DetailScreenRouterProtocol: AnyObject  {
    static func createModule(currentMeter:Int,serviceNumber:String) -> UIViewController
}

