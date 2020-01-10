//
//  GoalCell.swift
//  goals-manager
//
//  Created by Kilyan SOCKALINGUM on 09/01/2020.
//  Copyright © 2020 Kilyan SOCKALINGUM. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    
    //Outlets
    @IBOutlet weak var goalDescLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    @IBOutlet weak var completionView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(goal: Goal){
        self.goalDescLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String(goal.goalCurrentValue)
        
        if goal.goalCurrentValue == goal.goalEndValue {
            self.completionView.isHidden = false
        } else {
            self.completionView.isHidden = true
        }
    }
}
