//
//  GameScene.swift
//  Project17test
//
//  Created by Ильдар Нигметзянов on 17.11.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import SpriteKit


class GameScene: SKScene,SKPhysicsContactDelegate {
    
    var time = 1.0
    let possibleEnemies = ["hammer","ball","tv"]
    var gameTimer: Timer?
    var isGameOver = false
    
    var scoreLabel: SKLabelNode!
    var starfield: SKEmitterNode!
    
    var player: SKSpriteNode!
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .black
        
        starfield = SKEmitterNode(fileNamed: "starfield")!
        starfield.advanceSimulationTime(10)
        starfield.position = CGPoint(x: 1024, y: 384)
        addChild(starfield)
        starfield.zPosition = -1
        
        player = SKSpriteNode(imageNamed: "player")
        player.position = CGPoint(x: 100, y: 384)
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size:player.size)
        player.physicsBody?.contactTestBitMask = 1
        addChild(player)
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.position = CGPoint(x: 16, y: 16)
        scoreLabel.horizontalAlignmentMode = .left
        addChild(scoreLabel)
        
        score = 0
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
        
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(createEnemy), userInfo: nil, repeats: true)
        
    }
    var amount = 1
    @objc func createEnemy() {
        guard let enemy = possibleEnemies.randomElement() else {return}
        
        let sprite = SKSpriteNode(imageNamed: enemy)
        sprite.position = CGPoint(x: 1200, y: Int.random(in: 50...736))
        addChild(sprite)
        
        sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: sprite.size)
        sprite.physicsBody?.velocity = CGVector(dx: -500, dy: 0)
        sprite.physicsBody?.angularVelocity = 5
        sprite.physicsBody?.categoryBitMask = 1
        sprite.physicsBody?.linearDamping = 0
        sprite.physicsBody?.angularVelocity = 0
        
        if amount % 20 == 0 {
            gameTimer?.invalidate()
            time -= 0.1
            gameTimer = Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(createEnemy), userInfo: nil, repeats: true)
        }
        amount += 1
    }
    
    override func update(_ currentTime: TimeInterval) {
        for node in children {
            if node.position.x < -300 {
                node.removeFromParent()
            }
        }
        
        if !isGameOver {
            score += 1
        }
    }
    
    var globalLocation = CGPoint(x: 100, y: 384)
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else {return}
        var location = touch.location(in: self)
        location = globalLocation
        
        location = touch.location(in: self)
        
        if location.y < 100 {
            location.y = 100
        } else if location.y > 668 {
            location.y = 668
        }
        
        player.position = location
        //globalLocation = player.position
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let explosion = SKEmitterNode(fileNamed: "explosion")!
        explosion.position = player.position
        addChild(explosion)
        
        player.removeFromParent()
        
        isGameOver = true
        gameTimer?.invalidate()
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       player.removeFromParent()
       isGameOver = true
       gameTimer?.invalidate()
    }
    
}
