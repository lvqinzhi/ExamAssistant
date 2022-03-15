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
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(showExitWarningAlert))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "camera"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
    }
    
    
    @objc func showExitWarningAlert() {
        let alert = UIAlertController(title: "警告", message: "您确定要退出登录吗？", preferredStyle: UIAlertController.Style.alert)
        let enter = UIAlertAction(title: "确定", style: UIAlertAction.Style.destructive, handler: {(UIAlertAction) -> Void in self.showExitWarningAgainAlert()})
        let cancel = UIAlertAction(title: "取消", style: UIAlertAction.Style.default, handler: nil
        )
        alert.addAction(enter)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showExitWarningAgainAlert() {
        let alert = UIAlertController(title: "警告", message: "请再次确认是否退出。", preferredStyle: UIAlertController.Style.alert)
        let enter = UIAlertAction(title: "确定", style: UIAlertAction.Style.destructive, handler: {(UIAlertAction) -> Void in self.dismiss(animated: true, completion: nil)})
        let cancel = UIAlertAction(title: "取消", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(enter)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }


}

