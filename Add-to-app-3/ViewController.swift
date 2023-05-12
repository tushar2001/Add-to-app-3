//
//  ViewController.swift
//  Add-to-app
//
//  Created by OLX on 05/05/23.
//
import UIKit
import Flutter

class ViewController: UIViewController {
    
    let label = UILabel(frame: CGRect(x: 80, y: 150, width: 160, height: 20))
    var methodChannel: FlutterMethodChannel?
    var count = 0
    
//    let flutterViewController: FlutterViewController
    
    required init?(coder aDecoder: NSCoder) {
//        self.flutterViewController = SingleFlutterViewController(withEntrypoint: "main")
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make a button to call the showFlutter function when pressed.
        let button = UIButton(type:UIButton.ButtonType.custom)
        button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
        button.setTitle("Show Flutter!", for: UIControl.State.normal)
        button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
        
        let secondButton = UIButton()
        secondButton.addTarget(self, action: #selector(showSecondScreen), for: .touchUpInside)
        secondButton.setTitle("Show second Screen", for: .normal)
        secondButton.titleLabel?.adjustsFontSizeToFitWidth = true
        secondButton.frame = CGRect(x: 80.0, y: 300.0, width: 160.0, height: 40.0)
        secondButton.backgroundColor = .blue
        view.addSubview(secondButton)
        
        label.text = "Score: \(count)"
        view.addSubview(label)
        
        if let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine {
            methodChannel = FlutterMethodChannel(name: "com.quizzler",
                                                 binaryMessenger: flutterEngine.binaryMessenger)
            methodChannel?.setMethodCallHandler({ [weak self]
                (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                if let strongSelf = self {
                    switch(call.method) {
                    case "incrementScore":
                        strongSelf.count += 1
                        strongSelf.label.text = "Score: \(strongSelf.count)"
                        strongSelf.reportCounter()
                    default:
                        print("Unrecognized method name: \(call.method)")
                    }
                }
            })
        }
    }
    
    func reportCounter() {
        methodChannel?.invokeMethod("reportScore", arguments: count)
    }
    
    // Single Flutter Engine
    
    @objc func showFlutter() {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        //          flutterEngine.run()
        
        let flutterViewController =
        FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        navigationController?.pushViewController(flutterViewController, animated: true)
    }
    
    @objc func showSecondScreen() {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine2
        //            flutterEngine.run(withEntrypoint: "secondary")
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        navigationController?.pushViewController(flutterViewController, animated: true)
    }
    
    // Multiple Flutter Engines
//    @objc func showFlutter() {
////        let flutterViewController = SingleFlutterViewController(withEntrypoint: "main")
//        navigationController?.pushViewController(flutterViewController, animated: true)
////        present(flutterViewController, animated: true, completion: nil)
//    }
//
//    @objc func showSecondScreen() {
//        let flutterViewController2 = SingleFlutterViewController(withEntrypoint: "secondary")
//        navigationController?.pushViewController(flutterViewController2, animated: true)
//    }
}
