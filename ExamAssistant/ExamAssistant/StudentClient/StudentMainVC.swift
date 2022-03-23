//
//  StudentMainVC.swift
//  ExamAssistant
//
//  Created by 吕勤治 on 2022/3/23.
//

import UIKit

class StudentMainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "我的考试"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(showExitWarningAlert))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "qrcode"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
    }
    
    @objc func showExitWarningAlert() {
        let alert = UIAlertController(title: "警告", message: "您确定要退出登录吗？", preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil
        )
        let enter = UIAlertAction(title: "确定", style: UIAlertAction.Style.destructive, handler: {(UIAlertAction) -> Void in self.showExitWarningAgainAlert()})
        alert.addAction(cancel)
        alert.addAction(enter)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showExitWarningAgainAlert() {
        let alert = UIAlertController(title: "警告", message: "请再次确认是否退出。", preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        let enter = UIAlertAction(title: "确定", style: UIAlertAction.Style.destructive, handler: {(UIAlertAction) -> Void in self.dismiss(animated: true, completion: nil)})
        alert.addAction(cancel)
        alert.addAction(enter)
        self.present(alert, animated: true, completion: nil)
    }

}
