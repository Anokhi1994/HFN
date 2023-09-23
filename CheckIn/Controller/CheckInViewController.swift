//
//  ViewController.swift
//  CheckIn
//
//  Created by Anokhi Shah on 15.09.23.
//

import UIKit

class CheckInViewController: UIViewController,UIPickerViewDataSource {
    
    let batchManager = BatchManager()
    

    @IBOutlet weak var startCheckIn: UIButton!
    
    @IBOutlet weak var infoTextField: UITextField!
    
    @IBOutlet weak var batchPicker: UIPickerView!
    
    @IBOutlet weak var ScanClicked: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTargetIsNotEmptyTextFields()
        batchPicker.dataSource = self
        batchPicker.delegate = self
    }
    
    func setupAddTargetIsNotEmptyTextFields() {
        startCheckIn.isEnabled = false //hidden okButton
        infoTextField.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
       }
    
    @objc func textFieldsIsNotEmpty(sender: UITextField) {

        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)

        guard
          let name = infoTextField.text, !name.isEmpty
          else
        {
          self.startCheckIn.isEnabled = false
          return
        }
        // enable okButton if all conditions are met
        startCheckIn.isEnabled = true
       }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
}


extension CheckInViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return batchManager.batchArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return batchManager.batchArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
}

extension CheckInViewController: UITextFieldDelegate{
    
    @IBAction func StartCheckInPressed(_ sender: UIButton) {
        infoTextField.endEditing(true)
        print(infoTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        infoTextField.endEditing(true)
        print(infoTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }
        else {
            infoTextField.text = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let info = infoTextField.text{
            print(info)

        }
        
        infoTextField.text = ""
    }


    
    
}
