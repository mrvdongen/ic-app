//
//  PhysicianViewController.swift
//  IC-App
//
//  Created by Mike Dongen van on 13/11/2016.
//  Copyright © 2016 Mike Dongen van. All rights reserved.
//

import UIKit

class PhysicianViewController: UIViewController {

    @IBOutlet weak var inpPin: UITextField!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn0: UIButton!
    
    private var pin:[Int] = []
    private let physician = Physician()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindFuncToButton()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pressNumber(sender: UIButton){
        let number:Int = (sender as AnyObject).tag
        print(number)
        pin.append(number)
        checkSubmit()
        bindPin()
        //addPinToScreen(number)
    }

    @IBAction func pressDell(_ sender: Any) {
        if pin.count == 0{
            return
        }
        pin.removeLast()
        bindPin()
    }
    
    func checkSubmit(){
        if self.pin.count != 4{
            return
        }
        
        if(!physician.checkPin(pin: self.pin)){
            displayError()
            return
        }
        submit()
    }
    
    func submit(){
        print("seque next page")
    }
    
    func displayError(){
        print("error")
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: inpPin.center.x - 10, y: inpPin.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: inpPin.center.x + 10, y: inpPin.center.y))
        inpPin.layer.add(animation, forKey: nil)
        //inpPin.center.x - 10, inpPin.center.y
    }
    
    func bindPin(){
        inpPin.text = ""
        for val in pin{
            inpPin.text = inpPin.text! + String(val)
        }
    }
    
    // TODO dit moet beter kunnen?!?!??
    func bindFuncToButton(){
        btn9.addTarget(self, action: #selector(pressNumber(sender:)), for: .touchUpInside)
        btn8.addTarget(self, action: #selector(pressNumber(sender:)), for: .touchUpInside)
        btn7.addTarget(self, action: #selector(pressNumber(sender:)), for: .touchUpInside)
        btn6.addTarget(self, action: #selector(pressNumber(sender:)), for: .touchUpInside)
        btn5.addTarget(self, action: #selector(pressNumber(sender:)), for: .touchUpInside)
        btn4.addTarget(self, action: #selector(pressNumber(sender:)), for: .touchUpInside)
        btn3.addTarget(self, action: #selector(pressNumber(sender:)), for: .touchUpInside)
        btn2.addTarget(self, action: #selector(pressNumber(sender:)), for: .touchUpInside)
        btn1.addTarget(self, action: #selector(pressNumber(sender:)), for: .touchUpInside)
        btn0.addTarget(self, action: #selector(pressNumber(sender:)), for: .touchUpInside)
    }
}
