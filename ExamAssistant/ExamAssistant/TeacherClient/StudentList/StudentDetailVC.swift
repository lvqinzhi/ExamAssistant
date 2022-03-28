//
//  StudentDetailVC.swift
//  ExamAssistant
//
//  Created by 吕勤治 on 2022/3/20.
//

import UIKit

class StudentDetailVC: UIViewController {
    
    // 上级页面传值
    var studentNumber: String?
    
    @IBOutlet weak var studentNumberTextField: UITextField!
    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var studentClassTextField: UITextField!
    @IBOutlet weak var studentPhoneTextField: UITextField!
    @IBOutlet weak var studentStatusTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "学生详情"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "编辑", style: UIBarButtonItem.Style.plain, target: self, action: #selector(textFieldEnabled))
        // 文本框默认不可编辑，进入编辑模式才能进行编辑操作
        textFieldUnenabled()
        studentNumberTextField.text = studentNumber
    }
    
    // 文本框进入编辑状态，进入编辑模式
    @objc func textFieldEnabled() {
        studentNumberTextField.isEnabled = true
        studentNameTextField.isEnabled = true
        studentClassTextField.isEnabled = true
        studentPhoneTextField.isEnabled = true
        studentStatusTextField.isEnabled = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "完成", style: UIBarButtonItem.Style.plain, target: self, action: #selector(finishStudentInfoEdit))
    }
    
    // 结束编辑模式
    @objc func finishStudentInfoEdit() {
        textFieldUnenabled()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "编辑", style: UIBarButtonItem.Style.plain, target: self, action: #selector(textFieldEnabled))
    }
    
    // 取消文本框编辑状态
    func textFieldUnenabled() {
        studentNumberTextField.isEnabled = false
        studentNameTextField.isEnabled = false
        studentClassTextField.isEnabled = false
        studentPhoneTextField.isEnabled = false
        studentStatusTextField.isEnabled = false
    }
    
}

