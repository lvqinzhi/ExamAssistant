//
//  AddStudentInfoVC.swift
//  ExamAssistant_T
//
//  Created by 吕勤治 on 2022/3/12.
//

import UIKit

class AddStudentInfoVC: UIViewController {
    
    weak var stuListVC: UIViewController?
    var studentCount: Int?
    @IBOutlet weak var numberText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var classText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    var importTag: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func importInfo(_ sender: Any) {
        if numberText.text == "" || nameText.text == "" || classText.text == "" || phoneText.text == "" {
            showAddEmptyAlert()
        } else if !(isPureDigit(string: numberText.text! as NSString)) || isPureDigit(string: nameText.text! as NSString) || isPureDigit(string: classText.text! as NSString) || !(isPhoneNumber(string: phoneText.text! as NSString)) {
            showAddIllegalAlert()
        } else {
            importTag = 1
            studentCount! += 1
            showSuccessAddAlert()
        }
    }
    
    @IBAction func cancelAdd(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func enterAdd(_ sender: Any) {
        if importTag == 0 {
            showEmptyExitAlert()
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func isPureDigit(string: NSString) -> Bool {
        let scan: Scanner = Scanner(string: string as String)
        var val: Int = 0
        return scan.scanInt(&val) && scan.isAtEnd
    }
    
    func isPhoneNumber(string: NSString?) -> Bool {
        if let correctNumber = string {
            let mobileTag = "^1\\d{10}$"
            let numberPredicate = NSPredicate(format: "SELF MATCHES %@", mobileTag)
            return numberPredicate.evaluate(with: correctNumber);
        }
        return false;
    }
    
    @objc func showAddEmptyAlert() {
        let alert = UIAlertController(title: "错误", message: "请输入完整的信息！", preferredStyle: UIAlertController.Style.alert)
        let yes = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(yes)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func showAddIllegalAlert() {
        let alert = UIAlertController(title: "错误", message: "请输入合法的信息！", preferredStyle: UIAlertController.Style.alert)
        let yes = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(yes)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func showSuccessAddAlert() {
        let alert = UIAlertController(title: "完成", message: String(format: "录入成功，座位号为 %d 。", studentCount!), preferredStyle: UIAlertController.Style.alert)
        let yes = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(yes)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func showEmptyExitAlert() {
        let alert = UIAlertController(title: "警告", message: "您还没有录入任何信息，是否确定放弃已输入的内容并退出当前页？", preferredStyle: UIAlertController.Style.alert)
        let edit = UIAlertAction(title: "继续编辑", style: UIAlertAction.Style.cancel, handler: nil)
        let exit = UIAlertAction(title: "退出", style: UIAlertAction.Style.destructive, handler: {(UIAlertAction) -> Void in self.dismiss(animated: true, completion: nil)})
        alert.addAction(edit)
        alert.addAction(exit)
        self.present(alert, animated: true, completion: nil)
    }
    
}

