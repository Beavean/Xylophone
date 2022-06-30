//
//  ViewController.swift
//  Xylophone
//
//  Created by Beavean on 30.06.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    
    @IBOutlet var keyFrames: [UIButton]!
    
    
    @IBAction func keyPressed(_ sender: UIButton) {
        let url = Bundle.main.url(forResource: sender.currentTitle, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        for item in keyFrames {
            if item.currentTitle == sender.currentTitle {
                UIView.animate(withDuration: 0.1, delay: 0, options: []) {
                    item.alpha = 0.7
                    UIView.animate(withDuration: 0.1, delay: 0, options: []) {
                        item.alpha = 1
                    }
                }
            }
        }
        player.play()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for item in keyFrames {
            item.layer.cornerRadius = item.frame.height / 2
        }
    }
}




