//
//  LoginVC.swift
//  ExamAssistant_T
//
//  Created by 吕勤治 on 2022/3/15.
//

import UIKit
import CoreData

class LoginVC: UIViewController {

    @IBOutlet weak var userAccount: UILabel!
    @IBOutlet weak var userPassword: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "请登录"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.automatic
    }
    
    @IBAction func userLogin(_ sender: Any) {
        
    }
    
    @IBAction func userRegister(_ sender: Any) {
        
    }
    
}

