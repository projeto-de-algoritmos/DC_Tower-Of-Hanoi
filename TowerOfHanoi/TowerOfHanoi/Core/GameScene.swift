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
    
    var disks: [DiskNode] = {
        var disksArray: [DiskNode] = []
        for i in 0..<5 {
            disksArray.append(DiskNode(type: i))
        }
        return disksArray
    }()
    
    var diskBeingMoved: DiskNode?
    var movedDiskOriginalTower: TowerNode?

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        setupNodes()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if let touch = touches.first?.location(in: self) {
            func popDisk(from tower: TowerNode) {
                movedDiskOriginalTower = tower
                diskBeingMoved = tower.disks.pop()
            }

            if leftTower.contains(touch) {
                popDisk(from: leftTower)
            } else if middleTower.contains(touch) {
                popDisk(from: middleTower)
            } else if rightTower.contains(touch) {
                popDisk(from: rightTower)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        if let touch = touches.first?.location(in: self) {
            diskBeingMoved?.position = touch
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        if let touch = touches.first?.location(in: self), let diskBeingMoved = diskBeingMoved {
            func updateMovedDiskTower(to tower: TowerNode) {
                if diskBeingMoved.type < (tower.disks.peek()?.type ?? Int.max) {
                    diskBeingMoved.moveTo(tower: tower)
                    tower.disks.push(diskBeingMoved)
                    self.movedDiskOriginalTower = nil
                    self.diskBeingMoved = nil
                } else {
                    updateMovedDiskTower(to: self.movedDiskOriginalTower!)
                }
            }
            if leftTower.contains(touch) {
                updateMovedDiskTower(to: leftTower)
            } else if middleTower.contains(touch) {
                updateMovedDiskTower(to: middleTower)
            } else if rightTower.contains(touch) {
                updateMovedDiskTower(to: rightTower)
            } else {
                updateMovedDiskTower(to: self.movedDiskOriginalTower!)
            }
        }
    }

    func setupNodes() {
        setupBaseNode()
        setupTowers()
    }

    func setupTowers() {
        leftTower = TowerNode(type: .left)
        leftTower.anchorPoint = CGPoint(x: 0.5, y: 0)
        leftTower.position = CGPoint(x: size.width * 0.25, y: baseNode.frame.maxY)
        for disk in disks.reversed() {
            disk.moveTo(tower: leftTower)
            leftTower.disks.push(disk)
            disk.zPosition = 1
            addChild(disk)
        }
        addChild(leftTower)

        middleTower = TowerNode(type: .middle)
        middleTower.anchorPoint = CGPoint(x: 0.5, y: 0)
        middleTower.position = CGPoint(x: size.width * 0.5, y: baseNode.frame.maxY)
        addChild(middleTower)

        rightTower = TowerNode(type: .right)
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
