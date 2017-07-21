//
//  ViewController.swift
//  TrainingExe2
//
//  Created by mac on 7/21/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    var sexual = 0
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSubName: UITextField!
    @IBOutlet weak var txtMail: UITextField!
    @IBOutlet weak var txtBirthDay: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var checkMale: UIButton!
    @IBOutlet weak var checkFeMale: UIButton!
    @IBAction func clickMale(_ sender: Any) {
        sexual = 1
        checkMale.setImage(UIImage.init(named: "check2"), for: .normal)
        checkFeMale.setImage(UIImage.init(named: "check1"), for: .normal)
    }
    @IBAction func clickFeMale(_ sender: Any) {
        sexual = 2
        checkMale.setImage(UIImage.init(named: "check1"), for: .normal)
        checkFeMale.setImage(UIImage.init(named: "check2"), for: .normal)
    }
    @IBAction func clickSignUp(_ sender: Any) {
        
        let result = checkEmail(email: txtMail.text!)
        if !result {
            let alert = UIAlertController(title: "Lỗi", message: "Email sai định dạng", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            if (txtPhone.text?.isEmpty)! || (txtBirthDay.text?.isEmpty)! || (txtSubName.text?.isEmpty)! || (txtName.text?.isEmpty)! || (sexual==0) {
                let alert = UIAlertController(title: "Lỗi", message: "Bạn chưa điền đủ thông tin", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Đăng ký thành công !", message: "", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                }
        
    }
    }

        func checkEmail(email: String) -> Bool{
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            let result = emailTest.evaluate(with: email)
            return result
        }
}

