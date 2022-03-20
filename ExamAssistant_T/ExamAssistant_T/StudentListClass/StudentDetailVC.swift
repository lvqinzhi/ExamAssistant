//
//  StudentDetailVC.swift
//  ExamAssistant_T
//
//  Created by 吕勤治 on 2022/3/20.
//

import UIKit

class StudentDetailVC: UIViewController {
    
    var studentName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = studentName
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "编辑", style: UIBarButtonItem.Style.plain, target: self, action: nil)
    }
    
}
