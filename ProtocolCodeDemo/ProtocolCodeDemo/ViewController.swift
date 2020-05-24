//
//  ViewController.swift
//  ProtocolCodeDemo
//
//  Created by liyuzhu on 2020/5/24.
//  Copyright © 2020 leroy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - lazy var
    lazy var shakeView: ShakeView = {
        let v = ShakeView.loadViewFromNib()
        v.frame = CGRect.init(x: 40, y: 100, width: 200, height: 80)
        return v
    }()
    
    lazy var  centerBtn: UIButton = {
        let b = UIButton.init(type: .custom)
        b.backgroundColor = .red
        b.setTitle("Tap to shake", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.frame = CGRect.init(x: 0, y: 200, width: 200, height: 80)
        b.layer.cornerRadius = 10.0
        b.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        return b
    }()
    
    lazy var  showBtn: UIButton = {
        let b = UIButton.init(type: .custom)
        b.backgroundColor = .red
        b.setTitle("Tap to show", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.frame = CGRect.init(x: 0, y: 300, width: 200, height: 80)
        b.layer.cornerRadius = 10.0
        b.addTarget(self, action: #selector(showAction), for: .touchUpInside)
        return b
    }()

    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }

    func setup() {
        title = "main"
        view.addSubview(shakeView)
        view.addSubview(centerBtn)
        view.addSubview(showBtn)
        shakeView.center.x = view.center.x
        centerBtn.center.x = view.center.x
        showBtn.center.x = view.center.x
        Array
    }
    
    
    // MARK: - Action
    @objc func btnAction() {
        shakeView.shake()
    }
    
    @objc func showAction() {
        navigationController?.pushViewController(ListViewController(), animated: true)
    }
}

