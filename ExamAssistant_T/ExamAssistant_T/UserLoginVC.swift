//
//  UserLoginVC.swift
//  ExamAssistant_T
//
//  Created by 吕勤治 on 2022/3/15.
//

import UIKit
import OHMySQL

class UserLoginVC: UIViewController {
    
    var coordinator = MySQLStoreCoordinator()
    let context = MySQLQueryContext()
    var sqlConnectStatus: Bool = false
    
    @IBOutlet weak var userAccount: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "请登录"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.automatic
        
        let user = OHMySQLUser(user: "root", password: "20000508", serverName: "localhost", dbName: "ExamAssistant", port: 3306, socket: nil)
        coordinator = MySQLStoreCoordinator(configuration: user)
        coordinator.encoding = .UTF8MB4
        coordinator.connect()
        sqlConnectStatus = coordinator.isConnected
    }
    
    @IBAction func userLogin(_ sender: Any) {
        if userAccount.text == "" || userPassword.text == "" {
            showEmptyAlert()
        } else if sqlConnectStatus == true {
            context.storeCoordinator = coordinator
            let condition = String(format: "uid = '%@' and upasswd = '%@'", userAccount.text!, userPassword.text!)
            let query = MySQLQueryRequestFactory.select("user_account", condition: condition)
            
            do {
                let response = try context.executeQueryRequestAndFetchResult(query)
                
                if response.count == 0 {
                    contextErrorAlert()
                } else {
                    self.performSegue(withIdentifier: "userLogin", sender: nil)
                }
            } catch {
                contextErrorAlert()
            }
        } else {
            connectErrorAlert()
        }
    }
    
    func showEmptyAlert() {
        let alert = UIAlertController(title: "错误", message: "文本框内容不得为空，请检查后再次尝试！", preferredStyle: UIAlertController.Style.alert)
        let yes = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(yes)
        self.present(alert, animated: true, completion: nil)
    }
    
    func connectErrorAlert() {
        let alert = UIAlertController(title: "错误", message: "数据库连接失败，请检查网络连接或联系管理员。", preferredStyle: UIAlertController.Style.alert)
        let yes = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(yes)
        self.present(alert, animated: true, completion: nil)
    }
    
    func contextErrorAlert() {
        let alert = UIAlertController(title: "错误", message: "账户信息错误，请检查您的用户名或密码。", preferredStyle: UIAlertController.Style.alert)
        let yes = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(yes)
        self.present(alert, animated: true, completion: nil)
    }
    
}

