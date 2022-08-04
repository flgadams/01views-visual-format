//
//  ViewController.swift
//  template-swift-no-sb
//
//  Created by Glenn Adams on 7/30/22.
// A Swift project template for UIKit apps, no storyboards

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
        
        var vFormat = "V:|"
        var hFormat = ""

        var i=1
        for eachView in viewArr {
            view.addSubview(eachView)
            eachView.translatesAutoresizingMaskIntoConstraints=false
            print(i)
            vFormat = vFormat + "-25-[v\(i)(75)]"
            print(vFormat)
            hFormat =  "H:|-[v\(i)]-|"
            let h = NSLayoutConstraint.constraints(withVisualFormat: hFormat, metrics: nil, views: ["v\(i)":eachView])
            constraintsArr.append(contentsOf: h)
            print(hFormat)
            i+=1
        }
        
        let viewDict = ["v1":v1, "v2":v2, "v3":v3]
        
        let v = NSLayoutConstraint.constraints(withVisualFormat: vFormat, metrics: nil, views: viewDict)
        constraintsArr.append(contentsOf: v)
        
        NSLayoutConstraint.activate(constraintsArr.flatMap{$0})
       // let c1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v1(100)]-|", metrics: nil, views: viewDict)
       // let c2 = NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1(50)]", metrics: nil, views: viewDict)
        
       // NSLayoutConstraint.activate([c1,c2].flatMap{$0})
    }
    
    
}

