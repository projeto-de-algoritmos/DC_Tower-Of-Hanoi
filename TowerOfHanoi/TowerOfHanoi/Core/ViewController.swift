//
//  ViewController.swift
//  TowerOfHanoi
//
//  Created by Luis Gustavo Avelino de Lima Jacinto on 31/10/19.
//  Copyright © 2019 Luis Gustavo Avelino de Lima Jacinto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        TowerOfHanoi.shared.solve(numberOfDisks: 3, from: .left, to: .right, auxiliary: .middle)
    }


}

