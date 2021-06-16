//
//  ViewController.swift
//  GnrgySampleProject
//
//  Created by praveen on 16/06/21.
//

import UIKit

class FirstScreenViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var submitButton : UIButton!
    
    var color = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 60.0, target: self,selector: #selector(changeColor), userInfo: nil, repeats: true)
        
        colorView.layer.cornerRadius = 5
        colorView.layer.masksToBounds = true
        changeColor()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Button Action
    @IBAction func submitButtonClicked(){
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        cell.label.text = inputTextField.text
    }
    
    // MARK: - Changing Color of View
    @objc func changeColor(){
        let date = Date()
        let calender = NSCalendar.current
        let minutes = calender.component(.minute, from: date)
        
        if minutes % 2 == 0{
            colorView.backgroundColor = .green
            color = .green
        }else{
            colorView.backgroundColor = .red
            color = .red
        }
        
    }
    // MARK: - TableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.label.text = inputTextField.text
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView.cellForRow(at: indexPath) as! TableViewCell
        let data = cell.label.text
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondScreenViewController")as! SecondScreenViewController
        secondViewController.displayText = data ?? ""
        secondViewController.textColor = color
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

