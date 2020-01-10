//
//  GoalsVC.swift
//  goals-manager
//
//  Created by Kilyan SOCKALINGUM on 09/01/2020.
//  Copyright © 2020 Kilyan SOCKALINGUM. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {
    //Outlets
    @IBOutlet weak var tableview: UITableView!
    
    //Variables
    var goals: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.fetch { (success) in
            if success {
                if self.goals.count > 0 {
                    self.tableview.isHidden = false
                } else {
                    self.tableview.isHidden = true
                }
            }
        }
        self.tableview.reloadData()
    }

    //Actions
    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return }
        presentDetail(createGoalVC)
    }
    
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell {
            cell.configureCell(goal: goals[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
}

extension GoalsVC {
    func fetch(_ completion: @escaping CompletionHandler) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            goals = try managedContext.fetch(fetchRequest)
            print("Successfully fetch data")
            completion(true)
        } catch {
            debugPrint("Could not fetch \(error.localizedDescription)")
            completion(false)
        }
    }
}
