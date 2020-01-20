//
//  ViewController.swift
//  StepperAndSlider
//
//  Created by R Shantha Kumar on 9/18/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit
import RoundedSwitch
import GMStepper

class ViewController: UIViewController {

    @IBOutlet weak var labelSwitch: UISwitch!
    @IBOutlet weak var buttonSwitch: UISwitch!
    @IBOutlet weak var switchesSwitch: UISwitch!
    
    
    @IBOutlet weak var numberTextFeild: UITextField!
    
    
    @IBOutlet weak var verticalSwitch: UISwitch!
    
    @IBOutlet weak var horizontalSwitch: UISwitch!
    
    
    
     var slider: UISlider!
     var stepper: GMStepper!
    
  
    
    var switchLbl:UISwitch!
    var labels:UILabel!
    var buttons:UIButton!
    
    //LABELS FOR APPENDING VALUES
    
    var allLabels = [UILabel]()
    var allSwitches = [UISwitch]()
    var allButtons = [UIButton]()
    
    
    
    
    @IBAction func verticalSwitchAction(_ sender: Any) {
        
        if(verticalSwitch.isOn==true){
            
            horizontalSwitch.setOn(false, animated: true)
        }
            
        
    }
    
    
    @IBAction func horizontalSwitchActon(_ sender: Any) {
        
        if(horizontalSwitch.isOn==true){
            
            verticalSwitch.setOn(false, animated: true)
        }
            
        
    }
    
    
    
    
    
    @IBAction func createButton(_ sender: UIButton){
        
        //removing method
        
        
        for values in allLabels
        {
            values.removeFromSuperview()
        }
        for values in allSwitches
        {
            values.removeFromSuperview()
        }
        for values in allButtons
        {
            values.removeFromSuperview()
        }
        
      
        var ypos = 345
        var xpos = 30
        let gap = 30
        let value = Int(slider.value)
    
        
        if(labelSwitch.isOn==true&&horizontalSwitch.isOn==true)
        {
            var xposi = 30
        for x in 1...value
        {
            
            if(xposi>340)
            {
                xposi = 30
                ypos=ypos+34
            }
            labels = UILabel()
            labels.frame = CGRect(x: xposi, y: ypos, width: 43, height: 20)
            labels.backgroundColor = UIColor.orange
            allLabels.append(labels)
            xposi+=gap+20
            labels.text = "Lb\(x)"
            view.addSubview(labels)
            }
            }
        if(labelSwitch.isOn==true&&verticalSwitch.isOn==true)
        {
            
            for x in 1...value
            {
                
                if(ypos>800)
                {
                    ypos = 345
                    xpos=xpos+50
                }
                labels = UILabel()
                labels.frame = CGRect(x: xpos, y: ypos, width: 45, height: 20)
                labels.backgroundColor = UIColor.orange
                allLabels.append(labels)
                ypos+=gap
                labels.text = "Lbl\(x)"
                view.addSubview(labels)
            }
        }
      
             if(buttonSwitch.isOn==true&&horizontalSwitch.isOn==true)
            {
                for y in 1...value
            {
                
                if(xpos>340)
                {
                    xpos = 30
                    ypos=ypos+34
                }
                
                    buttons = UIButton()
                    buttons.frame = CGRect(x: xpos, y: ypos, width: 45, height: 20)
                    buttons.setTitle("BT\(y)", for: UIControl.State.normal)
                    allButtons.append(buttons)
                    xpos+=gap+20
                    view.addSubview(buttons)
                    buttons.backgroundColor = UIColor.blue
               }
               }
        if(buttonSwitch.isOn==true&&verticalSwitch.isOn==true)
        {
            for y in 1...value
            {
                
                if(ypos>800)
                {
                    ypos = 345
                    xpos=xpos+50
                }
                
                buttons = UIButton()
                buttons.frame = CGRect(x: xpos, y: ypos, width: 45, height: 20)
                buttons.setTitle("BT\(y)", for: UIControl.State.normal)
                allButtons.append(buttons)
                ypos+=gap
                view.addSubview(buttons)
                buttons.backgroundColor = UIColor.blue
            }
        }

        
            
            if(switchesSwitch.isOn==true&&horizontalSwitch.isOn==true)
            {
                var xposit = 20
                for y in 1...value
            {
                
                 if(xposit>360)
                   {
                    xposit = 20
                    ypos=ypos+34
                       }
                    switchLbl = UISwitch()
                    switchLbl.frame = CGRect(x: xposit, y: ypos, width: 20, height: 20)
                   switchLbl.tintColor = UIColor.black
                   switchLbl.thumbTintColor = UIColor.red
                    switchLbl.backgroundColor = UIColor.gray
                
                    allSwitches.append(switchLbl)
                    xposit+=gap+25
                    view.addSubview(switchLbl)
              }

        }
        if(switchesSwitch.isOn==true&&verticalSwitch.isOn==true)
        {
            for y in 1...value
            {
                if(ypos>800)
                {
                    ypos = 345
                    xpos=xpos+50
                }
                switchLbl = UISwitch()
                switchLbl.frame = CGRect(x: xpos, y: ypos, width: 20, height: 20)
                switchLbl.tintColor = UIColor.black
                switchLbl.thumbTintColor = UIColor.red
                switchLbl.backgroundColor = UIColor.gray
                
                allSwitches.append(switchLbl)
                ypos+=gap
                view.addSubview(switchLbl)
            }
            
        }
        
        }

    
    func methodUI(){
        
        slider.addTarget(self, action: #selector(sliderEventHandler), for: UIControl.Event.valueChanged)
        slider.minimumValue = 1
        slider.maximumValue = 100
        view.addSubview(slider)
        
        stepper.addTarget(self, action: #selector(stepperEventHandler), for: UIControl.Event.valueChanged)
        stepper.minimumValue = 1
        stepper.maximumValue = 100
        view.addSubview(stepper)
        
    }
    
    
    
     override func viewDidLoad() {
        super.viewDidLoad()
        switchesChange()
        
        
        slider = UISlider()
        slider.frame = CGRect(x: 200, y: 600, width: 200, height: 50)
        slider.backgroundColor = .red
        view.addSubview(slider)
        
        
        
        stepper = GMStepper()
        stepper.frame = CGRect(x: 200, y: 500, width: 200, height: 50)
        stepper.backgroundColor = .red
        view.addSubview(stepper)
        
        methodUI()
        
        
    }

   //EVENTHANDLER FOR SWITCHES,BUTTON,LABELS
    
    @objc func eventHandlerSwitches(switches:UISwitch){
       
        if(switches == labelSwitch)
        {
            switches.isOn == true
            buttonSwitch.setOn(false, animated: true)
            switchesSwitch.setOn(false, animated: true)
            
        }
        
        if(switches == buttonSwitch)
        {
            switches.isOn == true
            labelSwitch.setOn(false, animated: true)
            switchesSwitch.setOn(false, animated: true)
            
        }
        
        if(switches == switchesSwitch)
        {
            switches.isOn == true
            buttonSwitch.setOn(false, animated: true)
            labelSwitch.setOn(false, animated: true)
         
        }
        
        
}
    
    
    @objc func sliderEventHandler()
      {
       
        stepper.value = Double(slider.value)
         }
    
    @objc func stepperEventHandler()
    {
        
        slider.value = Float(stepper.value)
       
    }
    

   
    
    func switchesChange(){
        
    labelSwitch.addTarget(self, action: #selector(eventHandlerSwitches(switches:)), for: UIControl.Event.valueChanged)
    view.addSubview(labelSwitch)
        
    buttonSwitch.addTarget(self, action: #selector(eventHandlerSwitches(switches:)), for: UIControl.Event.valueChanged)
        view.addSubview(buttonSwitch)
        
    switchesSwitch.addTarget(self, action: #selector(eventHandlerSwitches(switches:)), for: UIControl.Event.valueChanged)
    view.addSubview(switchesSwitch)
        
    }
    
    
    
  
}

