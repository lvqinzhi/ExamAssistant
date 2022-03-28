//
//  ExamDetailVC.swift
//  ExamAssistant
//
//  Created by 吕勤治 on 2022/3/28.
//

import UIKit

class ExamDetailVC: UIViewController {
    
    // 上级页面传值
    var examName: String?
    
    @IBOutlet weak var examNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "考试详情"
        
        examNameLabel.text = examName
    }
}
