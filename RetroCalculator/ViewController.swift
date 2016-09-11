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
    
    
    var btnSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btnSoundPath = Bundle.main.path(forResource: "btn", ofType: "wav")
        let btnSoundURL = URL(fileURLWithPath: btnSoundPath!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: btnSoundURL)
        } catch let err as NSError {
            print(err.localizedDescription)
        }
        
    }
    
    
    @IBAction func numberPressed (sender: UIButton) {
        playSound()
    
    }
    
    //soundfunction for playing button audio
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
    }
    
}
