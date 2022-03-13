//
//  AddStudentInfoVC.swift
//  ExamAssistant_T
//
//  Created by 吕勤治 on 2022/3/12.
//

import UIKit

class AddStudentInfoVC: UIViewController {

    weak var viewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func cancelAdd(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func enterAdd(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

