//
//  ViewController.swift
//  Date&Time_Eve
//
//  Created by Julia Santos on 25/05/20.
//  Copyright © 2020 Julia Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTxt: UITextField!
    
    @IBOutlet weak var startTxt: UITextField!
    
    @IBOutlet weak var endTxt: UITextField!
    
    @IBOutlet weak var startLbl: UILabel!
    @IBOutlet weak var startLineView: UIView!
    
    @IBOutlet weak var endLbl: UILabel!
    @IBOutlet weak var endLineView: UIView!
    
    
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTimePicker()
        createDatePicker()
        
    }
    
    func createDatePicker() {
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //Done button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedDate))
        toolbar.setItems([doneBtn], animated: true)
        
        //assign toolbar
        dateTxt.inputAccessoryView = toolbar
        
        //assign date picker to the text field
        dateTxt.inputView = datePicker
        
        //date picker mode
        datePicker.datePickerMode = .date
        
    }
    
    func createTimePicker() {
        //toolbar
        let toolbarStart = UIToolbar()
        let toolbarEnd = UIToolbar()
        toolbarStart.sizeToFit()
        toolbarEnd.sizeToFit()

        //Done button
        let doneBtnStart = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedTimeStart))
        let doneBtnEnd = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedTimeEnd))

        toolbarStart.setItems([doneBtnStart], animated: true)
        toolbarEnd.setItems([doneBtnEnd], animated: true)

        //assign toolbar
        startTxt.inputAccessoryView = toolbarStart
        endTxt.inputAccessoryView = toolbarEnd

        //assign date picker to the text field
        startTxt.inputView = timePicker
        endTxt.inputView = timePicker

        //date picker mode
        timePicker.datePickerMode = .time
        
        startTxt.isHidden = true
        startLbl.isHidden = true
        startLineView.isHidden = true
        
        endTxt.isHidden = true
        endLbl.isHidden = true
        endLineView.isHidden = true
    }
    
    @objc func donePressedDate() {
        //formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        
        dateTxt.text = formatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }
    
    @objc func donePressedTimeStart() {
            //formatter
            let formatter = DateFormatter()
            formatter.dateStyle = .none
            formatter.timeStyle = .short

            startTxt.text = formatter.string(from: timePicker.date)

            self.view.endEditing(true)
        }

    @objc func donePressedTimeEnd() {
        //formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short

        endTxt.text = formatter.string(from: timePicker.date)

        self.view.endEditing(true)
    }
    
    @IBOutlet weak var addBtn: UIButton!
    
    @IBAction func setupAddBtn(_ sender: Any) {
        
        let addBtnImage = UIImage(named: "plus")
        let removeBtnImage = UIImage(named: "minus")
        
        if addBtn.isSelected == true {
            addBtn.setImage(addBtnImage, for: .normal)
            addBtn.setTitle("Add Time", for: .normal)
            addBtn.setTitleColor(#colorLiteral(red: 0.5101607442, green: 0.4184297919, blue: 0.919275105, alpha: 1), for: .normal)
            
        } else {
            addBtn.setImage(removeBtnImage, for: .normal)
            addBtn.setTitle("  Remove Time", for: .normal)
            addBtn.setTitleColor(#colorLiteral(red: 0.9607843137, green: 0.2, blue: 0.3450980392, alpha: 1), for: .normal)
            
            startTxt.isHidden = false
            startLbl.isHidden = false
            startLineView.isHidden = false
            
            endTxt.isHidden = false
            endLbl.isHidden = false
            endLineView.isHidden = false
        }
    }
}

