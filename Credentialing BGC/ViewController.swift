//
//  ViewController.swift
//  Credentialing BGC
//
//  Created by Kashif on 27/01/17.
//  Copyright © 2017 Kashif. All rights reserved.
//

import UIKit

@objc protocol tableViewData {
    @objc optional func delegate()
}

class SterlingSeekerBasicInfoCollectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, tableViewData {
    
    static public func viewController() -> SterlingSeekerBasicInfoCollectionViewController {
        let storyBoard : UIStoryboard = UIStoryboard(name: "SterlingSeekerBasicInfoCollection", bundle: Bundle(identifier: "com.care.CareSDK"))
        let sterlingSeekerBasicInfoCollectionViewController = storyBoard.instantiateViewController(withIdentifier: "sterlingSeekerBasicInfoCollectionViewController") as! SterlingSeekerBasicInfoCollectionViewController
        return sterlingSeekerBasicInfoCollectionViewController
    }


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var headerCell = HeaderTableViewCell()
        var inputCell = InputTableViewCell()
        var bottomCell = BottomTableViewCell()
        var DOBCell = DateOfBirthTableViewCell()
        
        var cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            headerCell = tableView.dequeueReusableCell(withIdentifier: "seekerBgcHeaderCell", for: indexPath) as! HeaderTableViewCell
            cell = headerCell
        case 1:
            inputCell = tableView.dequeueReusableCell(withIdentifier: "seekerBgcInfoCell", for: indexPath) as! InputTableViewCell
            inputCell.inputFieldName.text = "LEGAL FIRST NAME"
            inputCell.delegate = self
            cell = inputCell
        case 2:
            inputCell = tableView.dequeueReusableCell(withIdentifier: "seekerBgcInfoCell", for: indexPath) as! InputTableViewCell
            inputCell.inputFieldName.text = "LEGAL MIDDLE NAME"
//            inputCell.delegate = self
            cell = inputCell
        case 3:
            inputCell = tableView.dequeueReusableCell(withIdentifier: "seekerBgcInfoCell", for: indexPath) as! InputTableViewCell
            inputCell.inputFieldName.text = "LEGAL LAST NAME"
//            inputCell.delegate = self
            cell = inputCell
        case 4:
            inputCell = tableView.dequeueReusableCell(withIdentifier: "seekerBgcInfoCell", for: indexPath) as! InputTableViewCell
            inputCell.inputFieldName.text = "PERMANENT ADDRESS"
//            inputCell.delegate = self
            cell = inputCell
        case 5:
            inputCell = tableView.dequeueReusableCell(withIdentifier: "seekerBgcInfoCell", for: indexPath) as! InputTableViewCell
            inputCell.inputFieldName.text = "CITY,STATE AND ZIP CODE"
//            inputCell.delegate = self
            cell = inputCell
        case 6:
            DOBCell = tableView.dequeueReusableCell(withIdentifier: "DOBCell", for: indexPath) as! DateOfBirthTableViewCell
            DOBCell.inputLabel.text = "DATE OF BIRTH"
            DOBCell.delegate = self
            cell = DOBCell
        case 6:
            bottomCell = tableView.dequeueReusableCell(withIdentifier: "bottomTableViewCell", for: indexPath) as! BottomTableViewCell
            cell = bottomCell
            bottomCell.delegate = self
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "bottomTableViewCell", for: indexPath)
        }
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

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


class HeaderTableViewCell: UITableViewCell {
    
    var delegate : tableViewData?
    
    @IBOutlet weak var headerInfoLabel: UILabel!
    @IBOutlet weak var headerInfoButton: UIButton!
    @IBAction func headerInfoButton(_ sender: UIButton) {
    }
    

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


class InputTableViewCell: UITableViewCell {
    
    var delegate : tableViewData?
    
    @IBOutlet weak var inputFieldName: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


class BottomTableViewCell: UITableViewCell {
    
    var delegate : tableViewData?
    
    @IBAction func submitBGCDataButton(_ sender: UIButton) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}





