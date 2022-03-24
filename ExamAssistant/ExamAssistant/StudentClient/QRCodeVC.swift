//
//  QRCodeVC.swift
//  ExamAssistant
//
//  Created by 吕勤治 on 2022/3/25.
//

import UIKit

class QRCodeVC: UIViewController {
    
    @IBOutlet weak var qrCodeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "签到码"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "完成", style: UIBarButtonItem.Style.plain, target: self, action: #selector(finishSignIn))
        
        let qrcodeImage = generateQRCode(str: "31899001")
        qrCodeImageView.image = qrcodeImage
    }
    
    @objc func finishSignIn() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func generateQRCode(str: String) -> UIImage? {
        let data = str.data(using: String.Encoding.ascii)
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        filter.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 9, y: 9)
        guard let outputCode = filter.outputImage?.transformed(by: transform) else { return nil }
        return UIImage(ciImage: outputCode)
    }

}

