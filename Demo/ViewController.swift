//
//  ViewController.swift
//  Demo
//
//  Created by Peter Pan on 2021/12/20.
//

import UIKit
import AVFAudio

class ViewController: UIViewController {
    let synthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var loveTextField: UITextField!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var plane: UILabel!
    @IBOutlet weak var earth: UILabel!
    @IBOutlet weak var china: UILabel!
    @IBOutlet weak var taiwan: UILabel!
    let earthLocations = ["🌏","🌍","🌎"]
    var index = 0
    
    //設定飛機移動角度
    func planelocation(degrees: CGFloat) {
        plane.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi / 180 * degrees).translatedBy(x: 0, y: -150)
        valueLabel.text = "\(Int(degrees))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func speak(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: loveTextField.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        utterance.rate = 0.1
        utterance.pitchMultiplier = 2
        synthesizer.speak(utterance)
    }
    
    @IBAction func Move(_ sender: UISlider) {
        print(sender.value)
        china.transform = CGAffineTransform(translationX: CGFloat(10 + 0.4 * sender.value), y: 0)
        taiwan.frame.origin.x = CGFloat(270 - 0.4 * sender.value)
        planelocation(degrees: CGFloat(sender.value))
    }
    @IBAction func earthLocation(_ sender: UISegmentedControl) {
        index = sender.selectedSegmentIndex
        earth.text = earthLocations[index]
    }
}
