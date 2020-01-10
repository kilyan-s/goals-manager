//
//  CreateGoalVC.swift
//  goals-manager
//
//  Created by Kilyan SOCKALINGUM on 09/01/2020.
//  Copyright © 2020 Kilyan SOCKALINGUM. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {
    
    //Outlets
    @IBOutlet weak var goalTxtView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    //Variables
    var goalType: GoalType = .shortTerm
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Bind nextBtn to keyboard in order to move the button up when the keyboard is shown
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setUnselectedColor()
        
        goalTxtView.delegate = self
        
    }
    
    //Actions
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if goalTxtView.text != "" && goalTxtView.text != "What is your goal ?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else { return }
            finishGoalVC.initData(description: goalTxtView.text!, type: goalType)
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
        } else {
            
        }
    }
    
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setUnselectedColor()
    }
    
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        goalType = .longTerm
        shortTermBtn.setUnselectedColor()
        longTermBtn.setSelectedColor()
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTxtView.text = ""
        goalTxtView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            goalTxtView.text = "What is your goal ?"
            goalTxtView.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        }
    }
}
