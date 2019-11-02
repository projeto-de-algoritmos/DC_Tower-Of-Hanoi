//
//  ViewController.swift
//  TowerOfHanoi
//
//  Created by Luis Gustavo Avelino de Lima Jacinto on 31/10/19.
//  Copyright © 2019 Luis Gustavo Avelino de Lima Jacinto. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        guard let skView = view as? SKView else { preconditionFailure("view \(String(describing: view)) must be of type \(SKView.self)") }

        skView.showsFPS = true
        skView.showsNodeCount = true

        skView.ignoresSiblingOrder = true

        let scene = GameScene(size: skView.frame.size)

        scene.scaleMode = .aspectFill

        skView.presentScene(scene)

    }


}

