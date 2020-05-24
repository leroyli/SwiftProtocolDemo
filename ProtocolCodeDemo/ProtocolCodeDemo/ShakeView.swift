//
//  ShakeView.swift
//  ProtocolCodeDemo
//
//  Created by liyuzhu on 2020/5/24.
//  Copyright © 2020 leroy. All rights reserved.
//

import UIKit

class ShakeView: UIView, NibLoadable, Shakeable {

    @IBOutlet weak var centerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
