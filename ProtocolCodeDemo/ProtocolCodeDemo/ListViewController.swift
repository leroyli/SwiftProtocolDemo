//
//  ListViewController.swift
//  ProtocolCodeDemo
//
//  Created by liyuzhu on 2020/5/24.
//  Copyright © 2020 leroy. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let t = UITableView.init(frame: self.view.bounds, style: .plain)
        t.tableFooterView = UIView()
        t.rowHeight = 60
        return t
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        title = "list"
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.register(MMTableViewCell.self)
        tableView.register(MMNibTableViewCell.self)
    }
}

extension ListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as MMTableViewCell
        cell.textLabel?.text = "the row \(indexPath.row)"
        return cell
        */
        
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as MMNibTableViewCell
        cell.textLabel?.text = "the nib row \(indexPath.row)"
        return cell
    }
}
