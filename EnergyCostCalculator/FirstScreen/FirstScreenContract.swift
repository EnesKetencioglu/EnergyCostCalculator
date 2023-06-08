//
//  FirstScreenContract.swift
//  EnergyCostCalculator
//
//  Created by Enes Ketencioglu on 8.06.2023.
//  
//

import Foundation
import UIKit


protocol FirstScreenViewProtocol: AnyObject  {
    func showServiceAlert()
    func showMeterAlert()
    func showMeterAlert(lastRead:Int)
}

protocol FirstScreenPresenterProtocol: AnyObject  {
    
    var view: FirstScreenViewController? { get set }
    var interactor: FirstScreenInteractor? { get set }
    var router: FirstScreenRouter? { get set }
    
    func submitClicked(serviceNumber:String,currentMeter:Int?)

}

protocol FirstScreenInteractorProtocol: AnyObject  {
    func fetchDataForSeviceNumber(_ seviceNumber: String) -> [ElectricityData]

}

protocol FirstScreenRouterProtocol: AnyObject  {
    func navigateToDetailScreen(serviceNumber: String, currentMeter: Int?)
    static func createModule() -> UIViewController
}
