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
    
    // MARK: Properties
    var initialHeight: Int = 0
    let g = 9.8
    var circleWithParachute = SKShapeNode()
    var withParachuteSpeed:Double = 0
    
    var circleWithoutParachute = SKShapeNode()
    var withoutParachuteSpeed:Double = 0

    // MARK: Methods
    // This function runs once to set up the scene
    override func didMove(to view: SKView) {
        
        // Set the background colour
        self.backgroundColor = .black
        
        //add a circle
        circleWithParachute = SKShapeNode(circleOfRadius: 10)
        circleWithParachute.position = CGPoint(x: 300, y: self.initialHeight)
        addChild(circleWithParachute)
        
        circleWithoutParachute = SKShapeNode(circleOfRadius: 10)
        circleWithoutParachute.position = CGPoint(x: 500, y: self.initialHeight)
        addChild(circleWithoutParachute)
    

    }
    
    // This runs before each frame is rendered
    // Avoid putting computationally intense code in this function to maintain high performance
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        withParachuteSpeed += accelerationWithParachute(velocity: withParachuteSpeed, mass: 1)
        print(withParachuteSpeed)
        let newPosition = CGPoint(x: circleWithParachute.position.x, y: circleWithParachute.position.y - CGFloat(withParachuteSpeed))
        circleWithParachute.position = newPosition
        
        withoutParachuteSpeed += accelerationWithoutParachute(velocity: withoutParachuteSpeed, mass: 1)
        print(withoutParachuteSpeed)
        let newPosition1 = CGPoint(x: circleWithoutParachute.position.x, y: circleWithoutParachute.position.y-CGFloat(withoutParachuteSpeed))
        circleWithoutParachute.position = newPosition1
    }
    
    func accelerationWithoutParachute (velocity: Double, mass: Double) -> Double {
        return (g - pow(velocity, 2) * 0.031734 / mass)/60
    }


    //acceleration(velocity: 0.98, mass: 50)

    //for y in ys (stride(from: 0, to: height, by: 0.1)){
    //
    //}
    //

    func accelerationWithParachute (velocity: Double, mass: Double) -> Double {
        return (g - pow(velocity, 2) * 43.046 / mass)/60
    }
}
