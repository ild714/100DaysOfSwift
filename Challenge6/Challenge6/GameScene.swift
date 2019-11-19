//
//  GameScene.swift
//  Challenge6
//
//  Created by Ильдар Нигметзянов on 17.11.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import SpriteKit


class GameScene: SKScene,SKPhysicsContactDelegate {
    
    var leftT = 500 {
        didSet {
            let t = leftT/10
            if t <= 0 {
                leftTime.text = "Time \(0)"
            } else {
                leftTime.text = "Time \(t)"
            }
        }
    }
    var leftTime: SKLabelNode!
    var aim: SKSpriteNode!
    var scoreLabel: SKLabelNode!
    var score = 0 {
        didSet {
            scoreLabel.text = "score \(score)"
        }
    }
    var timer: Timer?
    
    override func didMove(to view: SKView) {
        
        leftTime = SKLabelNode(fontNamed: "Chalkduster")
        leftTime.position = CGPoint(x: 50, y: 50)
        leftTime.horizontalAlignmentMode = .left
        addChild(leftTime)
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.horizontalAlignmentMode = .left
        scoreLabel.position = CGPoint(x: 50, y: 10)
        addChild(scoreLabel)
        score = 0
        
        aim = SKSpriteNode(imageNamed: "aim")
        aim.size = CGSize(width: 100, height: 100)
        aim.position = CGPoint(x: Int.random(in: 100...700), y: Int.random(in: 100...700))
        aim.zPosition = 1
        aim.physicsBody = SKPhysicsBody(texture: aim.texture!, size: aim.size)
        aim.physicsBody?.contactTestBitMask = 1
        
        addChild(aim)
        
        timer = Timer.scheduledTimer(timeInterval: Double.random(in: 0.5...1), target: self, selector: #selector(updateAim), userInfo: nil, repeats: true)
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
    }
    
    @objc func updateAim() {
        aim.position = CGPoint(x: Int.random(in: 100...700), y: Int.random(in: 100...700))
    }
    
    override func update(_ currentTime: TimeInterval) {
        leftT -= 1
        if leftT == 0 {
            aim.removeFromParent()
            timer?.invalidate()
            leftT = 0
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let loc = touches.first else {return}
        let location = loc.location(in: self)
        
        let y = aim.position.y
        let y1 = y - 10
        let y2 = y + 10
        
        if  location.y > y1 && location.y < y2  {
            score += 1
        }
        
    }
    
    
}
