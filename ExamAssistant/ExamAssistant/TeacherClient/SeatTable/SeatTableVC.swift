//
//  SeatTableVC.swift
//  ExamAssistant
//
//  Created by 吕勤治 on 2022/2/18.
//

import UIKit

class SeatTableVC: UIViewController {
    
    private lazy var subFlutterVC: FlutterSeatTableVC = FlutterSeatTableVC(withEntrypoint: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "数据结构基础 教三201"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "刷新", style: UIBarButtonItem.Style.plain, target: self, action: #selector(refreshTable))
        
        addChild(subFlutterVC)
        let safeFrame = self.view.safeAreaLayoutGuide.layoutFrame
        subFlutterVC.view.frame = safeFrame
        self.view.addSubview(subFlutterVC.view)
        subFlutterVC.didMove(toParent: self)
    }
    
    @objc func refreshTable() {
        // TODO: Flutter seat table refresh status from database.
        
        let alert = UIAlertController(title: "完成", message: "学生状态刷新成功。", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }

}

