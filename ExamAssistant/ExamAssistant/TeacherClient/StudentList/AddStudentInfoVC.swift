//
//  AddStudentInfoVC.swift
//  ExamAssistant
//
//  Created by 吕勤治 on 2022/3/12.
//

import UIKit

class AddStudentInfoVC: UIViewController {
    
    var importTag: Int = 0
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "添加学生信息"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "完成", style: UIBarButtonItem.Style.plain, target: self, action: #selector(finishAddInfo))
    }
    
    // 检查文本框是否为空、输入内容是否合法，提醒或录入
    @IBAction func importStuInfo(_ sender: Any) {
        if numberTextField.text == "" || nameTextField.text == "" || classTextField.text == "" || phoneTextField.text == "" {
            showAddEmptyAlert()
        } else if !(isPureDigit(string: numberTextField.text! as NSString)) || isPureDigit(string: nameTextField.text! as NSString) || isPureDigit(string: classTextField.text! as NSString) || !(isPhoneNumber(string: phoneTextField.text! as NSString)) {
            showAddIllegalAlert()
        } else {
            importTag = 1
            showSuccessAddAlert()
        }
    }
    
    // 判断是否为纯数字
    func isPureDigit(string: NSString) -> Bool {
        let scan: Scanner = Scanner(string: string as String)
        var val: Int = 0
        return scan.scanInt(&val) && scan.isAtEnd
    }
    
    // 判断手机号是否合法（1开头11位）
    func isPhoneNumber(string: NSString?) -> Bool {
        if let correctNumber = string {
            let mobileTag = "^1\\d{10}$"
            let numberPredicate = NSPredicate(format: "SELF MATCHES %@", mobileTag)
            return numberPredicate.evaluate(with: correctNumber);
        }
        
        return false;
    }
    
    // 提示内容为空
    @objc func showAddEmptyAlert() {
        let alert = UIAlertController(title: "错误", message: "请输入完整的信息！", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    // 提示内容不合法
    func showAddIllegalAlert() {
        let alert = UIAlertController(title: "错误", message: "请输入合法的信息！", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    // 提示录入成功
    func showSuccessAddAlert() {
        let alert = UIAlertController(title: "完成", message: String(format: "录入成功，请返回名单页查看。"), preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    // 退出添加学生信息页
    @objc func finishAddInfo() {
        if importTag == 0 {
            showEmptyExitAlert()
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // 提示未录入但操作退出
    func showEmptyExitAlert() {
        let alert = UIAlertController(title: "警告", message: "您还没有录入任何信息，是否确定放弃已输入的内容并退出当前页？", preferredStyle: UIAlertController.Style.alert)
        let edit = UIAlertAction(title: "继续编辑", style: UIAlertAction.Style.cancel, handler: nil)
        let exit = UIAlertAction(title: "退出", style: UIAlertAction.Style.destructive, handler: {(UIAlertAction) -> Void in self.dismiss(animated: true, completion: nil)})
        alert.addAction(edit)
        alert.addAction(exit)
        self.present(alert, animated: true, completion: nil)
    }
    
}

