//
//  ParameterController.swift
//  IntroToSpriteKit
//
//  Created by William Chan on 2020-06-05.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//
import Cocoa
import SpriteKit
import GameplayKit

class ParameterController: NSViewController {
    
    // MARK: Properties & Outlets
    @IBOutlet weak var labelHeight: NSTextField!
    @IBOutlet weak var sliderHeight: NSSlider!
    
    // MARK: Methods
    
    
    // This method runs once when the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // All the customization happens below...
        
    }

    // This function gets invoked when the slider's value changes
    @IBAction func sliderHeightValueChanged(_ sender: NSSlider) {
        
        print(sender.integerValue)
        
    }
}
