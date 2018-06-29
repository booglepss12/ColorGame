//
//  GameScene.swift
//  ColorGame
//
//  Created by John Rooney on 2018-06-26.
//  Copyright © 2018 John Rooney. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var tracksArray:[SKSpriteNode]? = [SKSpriteNode]()
    var player:SKSpriteNode?
    
    func setUpTracks(){
        for i in 0...8{
            if let track = self.childNode(withName: "\(i)") as? SKSpriteNode{
                tracksArray?.append(track)
            }
        }
    }
    
    func createPlayer(){
        player = SKSpriteNode(imageNamed: "player")
        guard let playerPosition = tracksArray?.first?.position.x else {return}
        player?.position = CGPoint(x: playerPosition, y: self.size.height/2)
        self.addChild(player!)
    }
    override func didMove(to view: SKView) {
        setUpTracks()
        createPlayer()
        tracksArray?.first?.color = UIColor.green
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let location = touch.previousLocation(in: self)
            let node = self.nodes(at: location).first
            if node?.name == "right"{
                print ("moved right")
            }else if node?.name == "up"{
                print("moved up")
            }else if node?.name == "down"{
                print("moved down")
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        <#code#>
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
