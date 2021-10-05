//
//  ViewController.swift
//  LEDBoard
//
//  Created by sungyeon kim on 2021/10/01.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var changeColorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = ""
        textLabel.backgroundColor = .black
        
        userTextField.placeholder = "텍스트를 입력해주세요"
        userTextField.alpha = 0.5
        
        buttonUISetting(sendButton, buttonTitle: "보내기", buttonTitleColor: .white)
        buttonUISetting(changeColorButton, buttonTitle: "Aa", buttonTitleColor: .systemRed)
        
        userTextField.delegate = self
    }
    
    func buttonUISetting(_ btn: UIButton, buttonTitle: String, buttonTitleColor: UIColor) {
        
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.setTitle(buttonTitle, for: .normal)
        btn.setTitleColor(buttonTitleColor, for: .normal)
        btn.layer.borderWidth = 1.5
        btn.layer.borderColor = UIColor.white.cgColor
        
    }
    func textlabelSetting() {
        let text = userTextField.text
        textLabel.font = textLabel.font.withSize(80)
        textLabel.text = text
        userTextField.text = ""
    }

    @IBAction func changeColorButtonPressed(_ sender: UIButton) {
        textLabel.textColor = .random
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        userTextField.endEditing(true)
        textlabelSetting()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userTextField.endEditing(true)
        textlabelSetting()
        return true
    }
    
//     사용자가 키보드를 사용하지 않으면 호출
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            userTextField.placeholder = "텍스트를 입력해주세요"
            return true
        } else {
            textField.placeholder = "Type something here"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        userTextField.text = ""
    }
    

}

extension UIColor {
    public class var random: UIColor {
        return UIColor(red: CGFloat(drand48()),
                       green: CGFloat(drand48()),
                       blue: CGFloat(drand48()), alpha: 1.0)
    }
}

