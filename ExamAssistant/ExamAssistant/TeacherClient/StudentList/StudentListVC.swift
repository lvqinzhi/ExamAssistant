//
//  StudentListVC.swift
//  ExamAssistant
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
    
    // 刷新列表学生数据
    @objc func refreshList() {
        tableView.reloadData()
        
        let alert = UIAlertController(title: "完成", message: "学生列表刷新成功。", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    // 选择需要编辑的类型（插入/删除）
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
    
    // 跳转至添加学生信息页
    func showAddStudentInfoVC() {
        self.performSegue(withIdentifier: "showAddStudentInfoVC", sender: nil)
    }
    
    // 设置列表编辑模式
    func setEditStatus() {
        tableView.setEditing(true, animated: true)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "完成", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelEditStatus))
        self.navigationItem.leftBarButtonItem?.isEnabled = false
    }
    
    // 取消列表编辑模式
    @objc func cancelEditStatus() {
        tableView.setEditing(false, animated: true)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "刷新", style: UIBarButtonItem.Style.plain, target: self, action: #selector(refreshList))
        self.navigationItem.leftBarButtonItem?.isEnabled = true
    }
    
    // MARK: - UITableView Delegate
    // 列表行数，即数组中元素个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentData.count
    }
    
    // 列表项每一个数据对应数组中每一个元素，样式复用
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: identifier)
        cell?.textLabel?.text = studentData[indexPath.row]
        cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell!
    }
    
    // 以学号为关键字，点击跳转至学生信息详情页
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView!.deselectRow(at: indexPath, animated: true)
        let studentNumber = studentData[indexPath.row]
        self.performSegue(withIdentifier: "showStudentDetailVC", sender: studentNumber)
    }
    
    // 传值至二级页面
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showStudentDetailVC" {
            let controller = segue.destination as! StudentDetailVC
            controller.studentNumber = sender as? String
        }
    }
    
    // 指定编辑模式为删除
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing {
            return UITableViewCell.EditingStyle.delete
        }
        
        return UITableViewCell.EditingStyle.none
    }
    
    // 设置左滑删除文字为中文
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    // 执行删除操作，数组元素、标题人数、列表行各-1
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            studentData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.bottom)
            studentCount -= 1
            self.navigationItem.title = String(format: "数据结构基础 %d人", studentCount)
        }
    }
    
}

