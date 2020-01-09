//
//  GoalsVC.swift
//  goals-manager
//
//  Created by Kilyan SOCKALINGUM on 09/01/2020.
//  Copyright © 2020 Kilyan SOCKALINGUM. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {
    //Outlets
    @IBOutlet weak var tableview: UITableView!
    
    //Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Actions
    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        print("addGoalBtnWasPressed")
    }
    
}
