//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Mikael Teklehaimanot on 9/8/16.
//  Copyright © 2016 Mikael Teklehaimanot. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLbl: UILabel!
    
    enum Operation: String {
        case Add = "+"
        case Subtraction = "-"
        case Multiply = "*"
        case Divide = "/"
        case Empty = ""
    }
    
    var currentOperation = Operation.Empty
    var runningNumber = ""
    var leftSideNumber = ""
    var rightSideNumber = ""
    
    
    var btnSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        processOperation(operator: .Multiply)
    }
    
    @IBAction func subtractPressed(sender: UIButton) {
        processOperation(operator: .Subtraction)
    }
    
    @IBAction func addPressed(sender: UIButton) {
        processOperation(operator: .Add)
    }
    
    @IBAction func dividePressed(sender: UIButton) {
        processOperation(operator: .Divide)
    }
    
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
    }
    
    
    func processOperation(operator: Operation) {
        if currentOperation != Operation.Empty {
            
            //TODO: process math logic
            if runningNumber != "" {
                
                
                
            }
        }
    }
    
}


















































