//
//  ViewController.swift
//  ArthMETic App
//
//  Created by student on 2/14/19.
//  Copyright © 2019 nwmsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
  
    var activityPick:String = "Pick Activity"
    
    let activitys = ["Pick Activity","Bicycling","Jumping rope","Running - slow","Running - fast","Tennis","Swimming"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activitys[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activitys.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activityPick = activitys[row]
    }
    
    @IBOutlet weak var pickerView: UIPickerView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

   
    
    
    @IBOutlet weak var OutletTF: UITextField!
    @IBOutlet weak var WeightTF: UITextField!
    @IBOutlet weak var ExerciseTimeTF: UITextField!
    @IBOutlet weak var EnergyConsumedLBL: UILabel!
    @IBOutlet weak var Lose1PoundLBL: UILabel!
    
    
    
    @IBAction func CalculateBTN(_ sender: Any) {
        let weight : Double? = Double(WeightTF.text!)
        let exercise : Int? = Int(ExerciseTimeTF.text!)
        if exercise != nil && weight != nil && activityPick != "Pick Activity"{
            let time1 = ExerciseCoach.energyconsumed(during: activityPick, weight: weight!, time: exercise!)
            let time2 = ExerciseCoach.timeToLose1Pound(during: activityPick, weight: weight!)
            EnergyConsumedLBL.text = String(format: "%.1f", time1)+" "+"cal"
            Lose1PoundLBL.text = String(format : "%.1f" , time2)+" "+"minutes"
        }
        else if(weight == nil){
            WeightTF.text = "Enter correct weight!"
        }
        else{
            ExerciseTimeTF.text = "Enter correct time"
        }
        }
    
    
    @IBAction func ClearBTN(_ sender: Any) {
        WeightTF.text = ""
        ExerciseTimeTF.text = ""
        EnergyConsumedLBL.text = "0 cal"
        Lose1PoundLBL.text = "0 minutes"
        pickerView.selectRow(0, inComponent: 0, animated: true)
        }
   
    
}
    struct ExerciseCoach{
    static func energyconsumed(during: String, weight: Double, time: Int) -> Double{
        let sports: [String : Double] = ["Bicycling" : 8.0, "Jumping Rope": 12.3, "Running - slow" : 9.8, "Running - fast" : 23.0, "Tennis": 8.0, "Swimming" : 5.8]
        
       let met = sports [during]
        let energyConsume = met! * 3.5 * 150/2.2/200 * Double(time)
        return energyConsume
    }
        static func timeToLose1Pound(during:String ,weight: Double) -> Double {
            let sports: [String : Double] = ["Bicycling" : 8.0, "Jumping Rope": 12.3, "Running - slow" : 9.8, "Running - fast" : 23.0, "Tennis": 8.0, "Swimming" : 5.8]
        let met = sports[during]
        let timeToLose =  3500/(met! * 3.5 * 150/2.2/200)
            return timeToLose
    }
        
        
        
        
    
    
    
}

