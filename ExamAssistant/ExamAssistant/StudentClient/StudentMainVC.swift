//
//  StudentMainVC.swift
//  ExamAssistant
//
//  Created by 吕勤治 on 2022/3/23.
//

import UIKit

class StudentMainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var examData = ["微积分（下）", "数据结构基础", "离散数学", "大学物理（上）", "操作系统原理"]
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "我的考试"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "qrcode"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(showQRCodeVC))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(showExitWarningAlert))
        
        tableView = UITableView.init(frame: self.view.frame, style: UITableView.Style.plain)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.delegate = self
        tableView.dataSource = self
        // 设置列表行高
        tableView.rowHeight = 50
        self.view.addSubview(tableView)
    }
    
    // 跳转至签到码页
    @objc func showQRCodeVC() {
        self.performSegue(withIdentifier: "showQRCode", sender: nil)
    }
    
    // 提示是否需要退出登录
    @objc func showExitWarningAlert() {
        let alert = UIAlertController(title: "警告", message: "您确定要退出登录吗？", preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil
        )
        let ok = UIAlertAction(title: "确定", style: UIAlertAction.Style.destructive, handler: {(UIAlertAction) -> Void in self.showExitWarningAgainAlert()})
        alert.addAction(cancel)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    // 再次确认
    func showExitWarningAgainAlert() {
        let alert = UIAlertController(title: "警告", message: "请再次确认是否退出。", preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        let ok = UIAlertAction(title: "确定", style: UIAlertAction.Style.destructive, handler: {(UIAlertAction) -> Void in self.dismiss(animated: true, completion: nil)})
        alert.addAction(cancel)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - UITableView Delegate
    // 列表行数，即数组中元素个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examData.count
    }
    
    // 列表项每一个数据对应数组中每一个元素，样式复用
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: identifier)
        cell?.textLabel?.text = examData[indexPath.row]
        cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell!
    }
    
    // 以考试名称为关键字，点击跳转至考试信息详情页
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView!.deselectRow(at: indexPath, animated: true)
        let examName = examData[indexPath.row]
        self.performSegue(withIdentifier: "showExamDetailVC", sender: examName)
    }
    
    // 传值至二级页面
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showExamDetailVC" {
            let controller = segue.destination as! ExamDetailVC
            controller.examName = sender as? String
        }
    }

}
