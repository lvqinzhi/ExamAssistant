//
//  UserLoginVC.swift
//  ExamAssistant
//
//  Created by 吕勤治 on 2022/3/15.
//

import UIKit
import OHMySQL

class UserLoginVC: UIViewController {
    
    var coordinator = MySQLStoreCoordinator()
    let context = MySQLQueryContext()
    var sqlConnectStatus: Bool = false
    
    @IBOutlet weak var userAccountTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "请登录"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.automatic
        
        let sqlUser = OHMySQLUser(user: "root", password: "20000508", serverName: "localhost", dbName: "ExamAssistant", port: 3306, socket: nil)
        coordinator = MySQLStoreCoordinator(configuration: sqlUser)
        coordinator.encoding = .UTF8MB4
        coordinator.connect()
        sqlConnectStatus = coordinator.isConnected
    }
    
    @IBAction func userLogin(_ sender: Any) {
        if userAccountTextField.text == "" || userPasswordTextField.text == "" {
            showEmptyAlert()
        } else if sqlConnectStatus == true {
            context.storeCoordinator = coordinator
            let condition = String(format: "uid = '%@' and upasswd = '%@'", userAccountTextField.text!, userPasswordTextField.text!)
            let query = MySQLQueryRequestFactory.select("user_account", condition: condition)
            
            do {
                let response = try context.executeQueryRequestAndFetchResult(query)
                
                if response.count == 0 {
                    contextErrorAlert()
                } else {
                   showIdentifySheet()
                }
                
            } catch {
                contextErrorAlert()
            }
            
        } else {
            connectErrorAlert()
        }
    }
    
    func showEmptyAlert() {
        let alert = UIAlertController(title: "错误", message: "文本框内容不得为空，请完善后再次尝试或退出应用！", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func contextErrorAlert() {
        let alert = UIAlertController(title: "错误", message: "账户信息错误，请核对您的用户信息后再次尝试。", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showIdentifySheet() {
        let actionSheet = UIAlertController(title: "请选择您的身份", message: "如有疑问请联系管理员。", preferredStyle: UIAlertController.Style.actionSheet)
        let teacher = UIAlertAction(title: "教师", style: UIAlertAction.Style.default, handler: {(UIAlertAction) -> Void in self.performSegue(withIdentifier: "teacherLogin", sender: nil)})
        let student = UIAlertAction(title: "学生", style: UIAlertAction.Style.default, handler: {(UIAlertAction) -> Void in self.performSegue(withIdentifier: "studentLogin", sender: nil)})
        let cancel = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        actionSheet.addAction(teacher)
        actionSheet.addAction(student)
        actionSheet.addAction(cancel)
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func connectErrorAlert() {
        let alert = UIAlertController(title: "错误", message: "数据库连接失败，请检查网络连接或联系管理员。", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
}

