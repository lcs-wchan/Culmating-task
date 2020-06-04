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
    
    // Method is called right before the segue happen
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        
        
        // When the next window is the animation, pass certain pieces of information forward
        if let nextWindowController = segue.destinationController as? ViewController {
            
            // Pass the initial height on
            nextWindowController.initialHeight = labelHeight.integerValue
            
        }
        
        
    }

    // This function gets invoked when the slider's value changes
    @IBAction func sliderHeightValueChanged(_ sender: NSSlider) {
        
        // DEBUG: What value was selected?
        print(sender.integerValue)
        
        // Update the label to show what height has been selected
        labelHeight.stringValue = String(sender.integerValue)
        
    }
}