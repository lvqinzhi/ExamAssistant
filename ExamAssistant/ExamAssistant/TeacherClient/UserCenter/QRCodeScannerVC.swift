//
//  QRCodeScannerVC.swift
//  ExamAssistant
//
//  Created by 吕勤治 on 2022/3/25.
//

import UIKit

class QRCodeScannerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "学生签到"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "完成", style: UIBarButtonItem.Style.plain, target: self, action: #selector(showExitAlert))
    }
    
    @objc func showExitAlert() {
        let alert = UIAlertController(title: "警告", message: "您确定要退出吗？", preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        let ok = UIAlertAction(title: "确定", style: UIAlertAction.Style.destructive, handler: {(UIAlertAction) -> Void in self.dismiss(animated: true, completion: nil)})
        alert.addAction(cancel)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
}

