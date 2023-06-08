//
//  DetailScreenRouter.swift
//  EnergyCostCalculator
//
//  Created by Enes Ketencioglu on 8.06.2023.
//  
//

import Foundation
import UIKit
import CoreData

class DetailScreenRouter: DetailScreenRouterProtocol {
    
    weak var view: UIViewController?
    
    static func createModule(currentMeter:Int,serviceNumber:String) -> UIViewController {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "DetailScreen", bundle: nil)
        let view = mainStoryboard.instantiateViewController(withIdentifier: "DetailScreenViewController") as! DetailScreenViewController
        let presenter = DetailScreenPresenter()
        let interactor = DetailScreenInteractor(managedObjectContext: NSManagedObjectContext())
        let router = DetailScreenRouter()
        
        view.currentMeter = currentMeter
        view.serviceNumber = serviceNumber
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.view = view
        
        return view
    }
   
    
}
