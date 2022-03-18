//
//  StudentListVC.swift
//  ExamAssistant_T
//
//  Created by 吕勤治 on 2022/3/7.
//

import UIKit

class StudentListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var studentData = ["31899001", "31899002", "31899003", "31899004", "31899005", "31899006", "31899007", "31899008", "31899009", "31899010", "31899011", "31899012", "31899013", "31899014", "31899015", "31899016", "31899017", "31899018", "31899019", "31899020", "31899021", "31899022", "31899023", "31899024", "31899025", "31899026", "31899027", "31899028", "31899029", "31899030"]
    var studentCount: Int!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentCount = studentData.count
        
        self.navigationItem.title = String(format: "电路原理 %d人", studentCount)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "编辑", style: UIBarButtonItem.Style.plain, target: self, action: #selector(showEditSheet))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "导入", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        
        self.tableView = UITableView.init(frame: self.view.frame, style: UITableView.Style.plain)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(self.tableView)
    }
    
    @objc func showEditSheet() {
        let actionSheet = UIAlertController(title: "请选择您要进行的操作", message: "编辑完成后请前往座位表页面刷新状态。", preferredStyle: UIAlertController.Style.actionSheet)
        let add = UIAlertAction(title: "添加行", style: UIAlertAction.Style.default, handler: {(UIAlertAction) -> Void in self.addInfo()})
        let delete = UIAlertAction(title: "删除行", style: UIAlertAction.Style.destructive, handler: {(UIAlertAction) -> Void in self.setEditStatus()})
        let cancel = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        actionSheet.addAction(add)
        actionSheet.addAction(delete)
        actionSheet.addAction(cancel)
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func addInfo() {
        let addInfoVC = AddStudentInfoVC()
        addInfoVC.viewController = self
        self.present(addInfoVC, animated: true, completion: nil)
    }
    
    func setEditStatus() {
        self.tableView.setEditing(true, animated: true)
        navigationItem.leftBarButtonItem?.isEnabled = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "完成", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelEditStatus))
    }
    
    @objc func cancelEditStatus() {
        self.tableView.setEditing(false, animated: true)
        navigationItem.leftBarButtonItem?.isEnabled = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "导入", style: UIBarButtonItem.Style.plain, target: self, action: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: identifier)
        }
        
        cell?.textLabel?.text = studentData[(indexPath as NSIndexPath).row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing {
            return UITableViewCell.EditingStyle.delete
        }
        return UITableViewCell.EditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            studentData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.bottom)
            studentCount -= 1
            navigationItem.title = String(format: "电路原理 %d人", studentCount)
        }
    }
    
}

