//
//  StudentListVC.swift
//  ExamAssistant
//
//  Created by 吕勤治 on 2022/3/7.
//

import UIKit

class StudentListVC: UIViewController {
    
    var studentData = ["31899001", "31899002", "31899003", "31899004", "31899005", "31899006", "31899007", "31899008", "31899009", "31899010", "31899011", "31899012", "31899013", "31899014", "31899015", "31899016", "31899017", "31899018", "31899019", "31899020", "31899021", "31899022", "31899023", "31899024", "31899025", "31899026", "31899027", "31899028", "31899029", "31899030"]
    
    var studentCount: Int!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentCount = studentData.count
        
        self.navigationItem.title = String(format: "数据结构基础 %d人", studentCount)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "刷新", style:  UIBarButtonItem.Style.plain, target: self, action: #selector(refreshList))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "编辑", style: UIBarButtonItem.Style.plain, target: self, action: #selector(showEditSheet))
        self.navigationItem.backButtonTitle = "返回"
        
        tableView = UITableView.init(frame: self.view.frame, style: UITableView.Style.plain)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    @objc func refreshList() {
        tableView.reloadData()
        // TODO: Student list refresh status from database.
        
        let alert = UIAlertController(title: "完成", message: "学生列表刷新成功。", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func showEditSheet() {
        let actionSheet = UIAlertController(title: "请选择您要进行的操作", message: "编辑完成后请前往座位表页面刷新状态。", preferredStyle: UIAlertController.Style.actionSheet)
        let add = UIAlertAction(title: "添加行", style: UIAlertAction.Style.default, handler: {(UIAlertAction) -> Void in self.showAddStudentInfoVC()})
        let delete = UIAlertAction(title: "删除行", style: UIAlertAction.Style.destructive, handler: {(UIAlertAction) -> Void in self.setEditStatus()})
        let cancel = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        actionSheet.addAction(add)
        actionSheet.addAction(delete)
        actionSheet.addAction(cancel)
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func showAddStudentInfoVC() {
        self.performSegue(withIdentifier: "showAddStudentInfoVC", sender: nil)
    }
    
    func setEditStatus() {
        tableView.setEditing(true, animated: true)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "完成", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelEditStatus))
        self.navigationItem.leftBarButtonItem?.isEnabled = false
    }
    
    @objc func cancelEditStatus() {
        tableView.setEditing(false, animated: true)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "刷新", style: UIBarButtonItem.Style.plain, target: self, action: #selector(refreshList))
        self.navigationItem.leftBarButtonItem?.isEnabled = true
    }
    
}

