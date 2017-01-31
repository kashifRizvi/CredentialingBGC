//
//  DateOfBirthTableViewCell.swift
//  Credentialing BGC
//
//  Created by Kashif on 30/01/17.
//  Copyright © 2017 Kashif. All rights reserved.
//

import UIKit

class DateOfBirthTableViewCell: UITableViewCell {
    
    var delegate : tableViewData?
    
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var inputDOBTextField: UITextField!
    @IBAction func inputDOBTextField(_ sender: UITextField) {
        
        
        
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        sender.inputView = datePicker
        sender.addTarget(self, action: #selector(DateOfBirthTableViewCell.handleDatePicker(sender:)), for: .valueChanged)
        
    }
    
    
    func handleDatePicker (sender : UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let date = dateFormatter.string(from: sender.date)
        
        self.inputDOBTextField.text = date
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        inputDOBTextField.text = ""
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
