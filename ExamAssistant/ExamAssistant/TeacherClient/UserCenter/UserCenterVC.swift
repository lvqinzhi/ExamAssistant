//
//  UserCenterVC.swift
//  ExamAssistant
//
//  Created by 吕勤治 on 2022/3/1.
//

import UIKit
import AVFoundation

class UserCenterVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var userCenterFunction = ["获取监考信息", "学生签到", "关于"]
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "个人中心"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(showExitWarningAlert))
        
        tableView = UITableView.init(frame: self.view.frame, style: UITableView.Style.plain)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.delegate = self
        tableView.dataSource = self
        // 设置列表行高，禁止滑动
        tableView.rowHeight = 60
        tableView.isScrollEnabled = false
        self.view.addSubview(tableView)
    }
    
    // 检查相机权限状态，跳转至扫码签到页
    @objc func showQRCodeScannerVC() {
        authorizeCameraWith {[weak self] (reslut) in
            if reslut {
                self?.performSegue(withIdentifier: "showQRCodeScannerVC", sender: nil)
            } else {
                // 权限拒绝，进入系统设置
                DispatchQueue.main.asyncAfter(deadline: .now()+1.0, execute: {
                    let appSetting = URL(string:UIApplication.openSettingsURLString)
                    UIApplication.shared.open(appSetting!, options: [:], completionHandler: nil)
                })
            }
        }
    }
    
    // 根据相机权限状态进行不同操作
    func authorizeCameraWith(comletion:@escaping(Bool)-> Void) {
        let granted = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        
        switch granted {
        case AVAuthorizationStatus.authorized:
            comletion(true)
            break
        case AVAuthorizationStatus.denied:
            comletion(false)
            break
        case AVAuthorizationStatus.restricted:
            comletion(false)
            break
        // 首次启动，直接授权
        case AVAuthorizationStatus.notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted:Bool) in
                comletion(granted)
            })
            break
        default:
            return
        }
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
    
    // 再次提示确认
    func showExitWarningAgainAlert() {
        let alert = UIAlertController(title: "警告", message: "请再次确认是否退出。", preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        let ok = UIAlertAction(title: "确定", style: UIAlertAction.Style.destructive, handler: {(UIAlertAction) -> Void in self.dismiss(animated: true, completion: nil)})
        alert.addAction(cancel)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    // 提示本功能正在开发中
    func showDevelopingAlert() {
        let alert = UIAlertController(title: "敬请期待", message: "本功能正在开发中，稍后上线。", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - UITableView Delegate
    // 列表行数，即数组中元素个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userCenterFunction.count
    }
    
    // 列表项每一个数据对应数组中每一个元素，样式复用
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: identifier)
        cell?.textLabel?.text = userCenterFunction[indexPath.row]
        cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell!
    }
    
    // 通过下标判断点击不同行并执行不同操作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView!.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            showDevelopingAlert()
            break
        case 1:
            showQRCodeScannerVC()
            break
        case 2:
            self.performSegue(withIdentifier: "showAboutMeVC", sender: nil)
        default:
            return
        }
    }
    
}

