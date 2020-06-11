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
    var initialHeight: Double = 0
    var initialParachuteHeight: Double = 0
    var mass: Double = 0
    var velocity = 0
    var lastUpdateTime: TimeInterval = 0
    var dt: TimeInterval = 0

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
        circleWithParachute.position = CGPoint(x: 300, y: self.initialParachuteHeight)
        addChild(circleWithParachute)
        
        circleWithoutParachute = SKShapeNode(circleOfRadius: 10)
        circleWithoutParachute.position = CGPoint(x: 500, y: self.initialHeight)
        addChild(circleWithoutParachute)
    

    }
    
    // This runs before each frame is rendered
    // Avoid putting computationally intense code in this function to maintain high performance
    // NOTE: This method is called about 60 times per second
    override func update(_ currentTime: TimeInterval) {
        
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
        print ("\(dt*1000) millisecond since last update")
        
        // Called before each frame is rendered
        withParachuteSpeed += accelerationWithParachute(velocity: withParachuteSpeed, mass: mass)
        print("withParachuteSpeed is \(withParachuteSpeed)")
        let newPosition = CGPoint(x: circleWithParachute.position.x, y: circleWithParachute.position.y - CGFloat(withParachuteSpeed))
        circleWithParachute.position = newPosition
        
        withoutParachuteSpeed += accelerationWithoutParachute(velocity: withoutParachuteSpeed, mass: mass)
        print("withoutParachuteSpeed is \(withoutParachuteSpeed)")
        print("--")
        let newPosition1 = CGPoint(x: circleWithoutParachute.position.x, y: circleWithoutParachute.position.y-CGFloat(withoutParachuteSpeed))
        circleWithoutParachute.position = newPosition1
    }
    
// calculate new height
    height = height - velocity * dt
    height -= 0.5 * acceleration * pow(dt *2)
    print ("New height is: \(height)")
    
//    func accelerationWithoutParachute (velocity: Double, mass: Double) -> Double {
//        return (g - (pow(velocity, 2) * 0.031734 / mass))/60
//    }


    //acceleration(velocity: 0.98, mass: 50)

    //for y in ys (stride(from: 0, to: height, by: 0.1)){
    //
    //}
    //

//    func accelerationWithParachute (velocity: Double, mass: Double) -> Double {
//        return (g - (pow(velocity, 2) * 43.046 / mass))/60
//    }
}
