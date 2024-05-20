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
        // 使用 CGAffineTransform 進行旋轉和位移變換
        plane.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi / 180 * degrees).translatedBy(x: 0, y: -150)
        //  更新 valueLabel 的文本，顯示當前角度的整數值
        valueLabel.text = "\(Int(degrees))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    // 處理語音合成功能的按鈕點擊事件
    @IBAction func speak(_ sender: Any) {
        
        // 創建一個 AVSpeechUtterance 實例，使用 loveTextField 中的文本
        let utterance = AVSpeechUtterance(string: loveTextField.text!)
        // 設置語音合成的語言為繁體中文
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        // 設定語速
        utterance.rate = 0.1
        // 設定音調
        utterance.pitchMultiplier = 2
        // 使用合成器播放語音
        synthesizer.speak(utterance)
    }
    
    @IBAction func Move(_ sender: UISlider) {
        // 輸出滑動條的當前值
        print(sender.value)
        // 更新中國位置的水平位移
        china.transform = CGAffineTransform(translationX: CGFloat(10 + 0.4 * sender.value), y: 0)
        // 更新台灣位置的原點
        taiwan.frame.origin.x = CGFloat(270 - 0.4 * sender.value)
        // 更新飛機的位置和角度
        planelocation(degrees: CGFloat(sender.value))
    }
    @IBAction func earthLocation(_ sender: UISegmentedControl) {
        // 更新當前選中的地球圖標索引
        index = sender.selectedSegmentIndex
        earth.text = earthLocations[index]
    }
}
