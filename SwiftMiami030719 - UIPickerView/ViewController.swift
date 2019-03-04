//
//  ViewController.swift
//  SwiftMiami030719 - UIPickerView
//
//  Created by James Slusser on 3/4/19.
//  Copyright © 2019 James Slusser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var favoriteMonthTextField: UITextField!
    
    let months = ["January",
                "February",
                "March",
                "April",
                "May",
                "June",
                "July",
                "August",
                "September",
                "October",
                "November",
                "December"]
    
    var selectedMonth: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMonthPicker()
        createToolbar()
    }
    
    
    func createMonthPicker() {
        
        let monthPicker = UIPickerView()
        monthPicker.delegate = self
        
        favoriteMonthTextField.inputView = monthPicker
        
        //Customizations
       // monthPicker.backgroundColor = .black
    }
    
    
    func createToolbar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Customizations
    //    toolBar.barTintColor = .black
    //    toolBar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        favoriteMonthTextField.inputAccessoryView = toolBar
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return months.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return months[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedMonth = months[row]
        favoriteMonthTextField.text = selectedMonth
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
    //    label.textColor = .yellow
        label.textAlignment = .center
    //    label.font = UIFont(name: "Menlo-Regular", size: 17)
        
        label.text = months[row]
        
        return label
    }
}
