//
//  FirstScreenInteractor.swift
//  EnergyCostCalculator
//
//  Created by Enes Ketencioglu on 8.06.2023.
//  
//

import Foundation
import UIKit
import CoreData

class FirstScreenInteractor: FirstScreenInteractorProtocol {
    func fetchDataForSeviceNumber(_ seviceNumber: String) -> [ElectricityData] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }

        let managedObjectContext = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<ElectricityData> = ElectricityData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "customerID == %@", seviceNumber)
        
        // Sort descriptor to sort the results based on lastReadings
        let sortDescriptor = NSSortDescriptor(key: "lastReadings", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]

        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            return results
        } catch {
            print("Failed to fetch data for seviceNumber \(seviceNumber): \(error.localizedDescription)")
            return []
        }
    }
}
