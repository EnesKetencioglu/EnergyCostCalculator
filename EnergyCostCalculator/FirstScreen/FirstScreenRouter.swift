//
//  FirstScreenRouter.swift
//  EnergyCostCalculator
//
//  Created by Enes Ketencioglu on 8.06.2023.
//  
//

import Foundation
import UIKit

class FirstScreenRouter: FirstScreenRouterProtocol {
    weak var view: UIViewController?
    
    static func createModule() -> UIViewController {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "FirstScreen", bundle: nil)
        let view = mainStoryboard.instantiateViewController(withIdentifier: "FirstScreenViewController") as! FirstScreenViewController
        let presenter = FirstScreenPresenter()
        let interactor = FirstScreenInteractor()
        let router = FirstScreenRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.view = view
        
        return view
    }
    func navigateToDetailScreen(serviceNumber: String, currentMeter: Int?) {
        let vc = DetailScreenRouter.createModule(currentMeter: currentMeter!, serviceNumber: serviceNumber)
        vc.modalPresentationStyle = .fullScreen
        self.view?.present(vc, animated: true)
        
    }
}
