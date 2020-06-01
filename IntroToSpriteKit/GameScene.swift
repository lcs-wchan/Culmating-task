//
//  GameScene.swift
//  IntroToSpriteKit
//
//  Created by Russell Gordon on 2019-12-07.
//  Copyright © 2019 Russell Gordon. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene {
    let g = 9.8
    let height = 1000
    var circle = SKShapeNode()

   
    // This function runs once to set up the scene
    override func didMove(to view: SKView) {
        
        // Set the background colour
        self.backgroundColor = .black
        
        //add a circle
        circle = SKShapeNode(circleOfRadius: 10)
        circle.position = CGPoint(x: 300, y: 400)
        addChild(circle)
    

    }
    
    // This runs before each frame is rendered
    // Avoid putting computationally intense code in this function to maintain high performance
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        let y = accelerationWithParachute(velocity: 3, mass: 40)
        let newPosition = CGPoint(x: circle.position.x, y: circle.position.y - CGFloat(y))
        circle.position = newPosition
        
        
    }
    
    func accelerationWithoutParachute (velocity: Double, mass: Double) -> Double {
        return g - pow(velocity, 2) * 0.031734 / mass
    }


    //acceleration(velocity: 0.98, mass: 50)

    //for y in ys (stride(from: 0, to: height, by: 0.1)){
    //
    //}
    //

    func accelerationWithParachute (velocity: Double, mass: Double) -> Double {
        return g - pow(velocity, 2) * 43.046 / mass
    }
}
