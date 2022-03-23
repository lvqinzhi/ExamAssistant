//
//  StudentDetailVC.swift
//  ExamAssistant
//
//  Created by 吕勤治 on 2022/3/20.
//

import UIKit
import OHMySQL

class StudentDetailVC: UIViewController {
    
    var studentName: String?
    
    var coordinator = MySQLStoreCoordinator()
    let context = MySQLQueryContext()
    var sqlConnectStatus: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = studentName
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "编辑", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        
        let user = OHMySQLUser(user: "root", password: "20000508", serverName: "localhost", dbName: "ExamAssistant", port: 3306, socket: nil)
        coordinator = MySQLStoreCoordinator(configuration: user)
        coordinator.encoding = .UTF8MB4
        coordinator.connect()
        sqlConnectStatus = coordinator.isConnected
    }
    
}

