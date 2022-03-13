//
//  StudentListVC.swift
//  ExamAssistant_T
//
//  Created by 吕勤治 on 2022/3/7.
//

import UIKit

class StudentListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var studentData = ["Amy", "Bob", "David", "Green", "Mike"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "电路原理 30人"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "编辑", style: UIBarButtonItem.Style.plain, target: self, action: #selector(showEditSheet))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "导入", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        
        let screenRect = UIScreen.main.bounds
        let tableRect = CGRect(x: 0, y: 20, width: screenRect.size.width, height: screenRect.size.height - 88)
        
        let tableView = UITableView(frame: tableRect)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.setEditing(true, animated: true)
        self.view.addSubview(tableView)
    }
    
    
    @objc func showEditSheet() {
        let actionSheet = UIAlertController(title: "请选择您要进行的操作", message: "编辑完成后请前往座位表页面刷新状态", preferredStyle: UIAlertController.Style.actionSheet)
        let add = UIAlertAction(title: "添加行", style: UIAlertAction.Style.default, handler: {(UIAlertAction) -> Void in self.addInfo()})
        let delete = UIAlertAction(title: "删除行", style: UIAlertAction.Style.destructive, handler: nil)
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
        return UITableViewCell.EditingStyle.delete
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            studentData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.bottom)
        }
    }
    
    
}

