//
//  FinishGoalVC.swift
//  goals-manager
//
//  Created by Kilyan SOCKALINGUM on 10/01/2020.
//  Copyright © 2020 Kilyan SOCKALINGUM. All rights reserved.
//

import UIKit
import CoreData

typealias CompletionHandler = (_ Success: Bool) -> ()
let appDelegate = UIApplication.shared.delegate as? AppDelegate

class FinishGoalVC: UIViewController {
    //Outlets
    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTxtField: UITextField!
    
    //Variables
    var goalDescription: String!
    var goalType: GoalType!
    
    //Function
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
    }
    
    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }
    
    func save(_ completion: @escaping CompletionHandler){
        //context to save to coreData
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        //Create goal entity
        let goal = Goal(context: managedContext)
        
        //Set attributes
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalEndValue = Int32(pointsTxtField.text!)!
        goal.goalCurrentValue = Int32(0)
        
        //Try to save to coreDate otherwise throw error
        do {
            try managedContext.save()
            print("Save successful")
            completion(true)
        } catch {
            debugPrint("Could not save \(error.localizedDescription)")
            completion(false)
        }
        
    }
    
    //Actions
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        if pointsTxtField.text != "" {
            self.save { (success) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
}
