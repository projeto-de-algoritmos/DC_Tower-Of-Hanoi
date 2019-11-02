//
//  GameScene.swift
//  TowerOfHanoi
//
//  Created by Luis Gustavo Avelino de Lima Jacinto on 02/11/19.
//  Copyright © 2019 Luis Gustavo Avelino de Lima Jacinto. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    var baseNode: BaseNode!
    var leftTower: TowerNode!
    var middleTower: TowerNode!
    var rightTower: TowerNode!
    var disks = [DiskNode(type: .disk1), DiskNode(type: .disk2), DiskNode(type: .disk3)]

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        setupNodes()
    }

    func setupNodes() {
        setupBaseNode()
        setupTowers()
    }

    func setupTowers() {
        leftTower = TowerNode(type: .left)
        leftTower.anchorPoint = CGPoint(x: 0.5, y: 0)
        leftTower.position = CGPoint(x: size.width * 0.25, y: baseNode.frame.maxY)
//        for disk in disks {
//            leftTower.disks.push(disk)
//        }
        addChild(leftTower)

        middleTower = TowerNode(type: .left)
        middleTower.anchorPoint = CGPoint(x: 0.5, y: 0)
        middleTower.position = CGPoint(x: size.width * 0.5, y: baseNode.frame.maxY)
        addChild(middleTower)

        rightTower = TowerNode(type: .left)
        rightTower.anchorPoint = CGPoint(x: 0.5, y: 0)
        rightTower.position = CGPoint(x: size.width * 0.75, y: baseNode.frame.maxY)
        addChild(rightTower)
    }

    func setupBaseNode() {
        baseNode = BaseNode()
        baseNode.size.width = size.width
        baseNode.anchorPoint = CGPoint(x: 0.5, y: 0)
        baseNode.position = CGPoint(x: size.width/2, y: 0)
        addChild(baseNode)
    }
}
