//
//  ViewController.swift
//  template-swift-no-sb
//
//  Created by Glenn Adams on 7/30/22.
// A Swift project template for UIKit apps, no storyboards
// layout views vertially
// ideal for buttons

import UIKit

class RootViewController: UIViewController {

    lazy var oneButton:UIButton = {  //snip zxuibtnl
        let ui = UIButton(type: .system)
        ui.setTitle("OneB", for: .normal)
        ui.titleLabel?.font = .systemFont(ofSize: 20)
        ui.setTitleColor(UIColor.white, for: UIControl.State.normal)
        ui.backgroundColor = UIColor.orange
        ui.layer.borderWidth = 1
        ui.layer.cornerRadius = 16
        ui.addTarget(self, action: #selector(oneButtonTouchSelector), for: .touchUpInside)
        return ui
    }()
    
    @objc fileprivate func oneButtonTouchSelector(sender:Any) {
        let file = "\(#file)".components(separatedBy: "/").last!; NSLog("\n\u{2705} \(#function) Line \(#line) of \(file)\n")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
        
        var constraintsArr=[NSLayoutConstraint]()
        let v1 = oneButton
        v1.setTitle("ONE", for: .normal)
        v1.backgroundColor = .red
        
        let v2 = UIButton()
        v2.setTitle("TWO", for: .normal)
        v2.backgroundColor = .green
        
        let v3 = UIButton()
        v3.setTitle("THREE", for: .normal)
        v3.backgroundColor = .yellow
        
        let viewArr = [v1,v2, v3]
        var viewDict=Dictionary<String,UIView>()
        var vFormat = "V:|"
        var hFormat = ""

        for (i,eachView) in viewArr.enumerated() {
            view.addSubview(eachView)
            eachView.translatesAutoresizingMaskIntoConstraints=false
            vFormat = vFormat + "-25-[v\(i)(75)]"
            hFormat =  "H:|-[v\(i)]-|"
            let h = NSLayoutConstraint.constraints(withVisualFormat: hFormat, metrics: nil, views: ["v\(i)":eachView])
            constraintsArr.append(contentsOf: h)
            viewDict["v\(i)"] = eachView
        }
        
        let v = NSLayoutConstraint.constraints(withVisualFormat: vFormat, metrics: nil, views: viewDict)
        constraintsArr.append(contentsOf: v)
        
        NSLayoutConstraint.activate(constraintsArr.compactMap{$0})
    }
    
    
}

