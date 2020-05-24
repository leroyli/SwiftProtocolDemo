//
//  AnimateProtocol.swift
//  ProtocolCodeDemo
//
//  Created by liyuzhu on 2020/5/24.
//  Copyright © 2020 leroy. All rights reserved.
//

import UIKit

/**shake protocol*/
protocol Shakeable {}

extension Shakeable where Self : UIView {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint.init(x: self.center.x - 4.0, y: self.center.y)
        animation.toValue = CGPoint.init(x: self.center.x + 4.0, y: self.center.y)
        layer.add(animation, forKey: "position")
    }
}


/**load nib protocol*/
protocol NibLoadable: class {}

extension NibLoadable where Self: UIView {
    static var NibName: String {
        return String.init(describing: self)
    }
    static func loadViewFromNib() -> Self {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! Self
    }
}


/** reuse view protocol*/
protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String.init(describing: self)
    }
}

/**UITableView regist cell protocol*/
extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadable {
        let Nib = UINib(nibName: T.NibName, bundle: nil)
        register(Nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UITableViewCell>(_ : T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
}

/**UITableView create cell protocol*/
extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
      }
}


