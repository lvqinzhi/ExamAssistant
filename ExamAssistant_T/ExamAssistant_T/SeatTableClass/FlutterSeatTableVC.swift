//
//  FlutterSeatTableVC.swift
//  ExamAssistant_T
//
//  Created by 吕勤治 on 2022/2/28.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

class FlutterSeatTableVC: FlutterViewController {
    
    init(withEntrypoint entrypoint: String?) {
        let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let newEngine = appDelegate.engineGroup.makeEngine(withEntrypoint: entrypoint, libraryURI: nil)
        super.init(engine: newEngine, nibName: nil, bundle: nil)
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        self.init(withEntrypoint: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GeneratedPluginRegistrant.register(with: self.pluginRegistry())
    }
    
}

