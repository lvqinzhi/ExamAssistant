//
//  UserCenterVC.swift
//  ExamAssistant_T
//
//  Created by 吕勤治 on 2022/3/1.
//

import UIKit

class UserCenterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "个人中心"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "camera"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "qrcode"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
    }


}

