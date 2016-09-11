//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Mikael Teklehaimanot on 9/8/16.
//  Copyright © 2016 Mikael Teklehaimanot. All rights reserved.
//

import UIKit
import AVFoundation

enum Operation: String {
    case Add = "+"
    case Subtraction = "-"
    case Multiply = "*"
    case Divide = "/"
    case Empty = ""
}

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLbl: UILabel!
    
    var currentOperation = Operation.Empty
    var runningNumber = ""
    var leftSideNumber = ""
    var rightSideNumber = ""
    var result = ""
    
    var btnSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLbl.text = "0.0"
        let btnSoundPath = Bundle.main.path(forResource: "btn", ofType: "wav")
        let btnSoundURL = URL(fileURLWithPath: btnSoundPath!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: btnSoundURL)
        } catch let err as NSError {
            print("Hit Error...")
            print(err.localizedDescription)
        }
        
    }
    
    
    @IBAction func numberPressed (sender: UIButton) {
        playSound()
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber
    }
    
    
    @IBAction func multiplyPressed(sender: UIButton) {
        processOperation(operation: .Multiply)
    }
    
    @IBAction func subtractPressed(sender: UIButton) {

        processOperation(operation: .Subtraction)
    }
    
    @IBAction func addPressed(sender: UIButton) {
        processOperation(operation: .Add)
    }
    
    @IBAction func dividePressed(sender: UIButton) {
        processOperation(operation: .Divide)
    }
    
    @IBAction func equalsPressed(sender: UIButton) {
        //solve math logic here using both values
        processOperation(operation: currentOperation)
    }
    
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
    }
    
    //logic for deciding to equate operation or not
    func processOperation(operation: Operation) {
        playSound()
        if currentOperation != .Empty {
            //process operation
            if runningNumber != "" {
                rightSideNumber = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftSideNumber)! * Double(rightSideNumber)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftSideNumber)! / Double(rightSideNumber)!)"
                } else if currentOperation == Operation.Subtraction {
                    result = "\(Double(leftSideNumber)! - Double(rightSideNumber)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftSideNumber)! + Double(rightSideNumber)!)"
                }
                
                leftSideNumber = result
                outputLbl.text = result
            }
            currentOperation = operation
        } else {
            //first time operator was selected
            leftSideNumber = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }//END func
    
}//END class


















































