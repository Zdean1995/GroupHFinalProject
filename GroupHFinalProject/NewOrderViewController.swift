//
//  NewOrderViewController.swift
//  GroupHFinalProject
//
//  Created by Ertugrul on 2023-04-15.
//

import UIKit

class NewOrderViewController: UIViewController {
  
    @IBOutlet weak var deliverySwitch: UISwitch!
    @IBOutlet weak var smallText: UILabel!

    @IBOutlet weak var largeText: UILabel!
    @IBOutlet weak var mediumText: UILabel!
    @IBOutlet weak var toppinsTextFiled: UITextField!
    @IBOutlet weak var sSwitch: UISwitch!
    @IBOutlet weak var mSwitch: UISwitch!
    @IBOutlet weak var lSwitch: UISwitch!
    //    @IBOutlet weak var SideTableView: UITableView!
//    @IBOutlet weak var DrinkTableView: UITableView!
  
    @IBOutlet weak var subTotalLabel: UILabel!
    
    @IBOutlet weak var taxLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    var orderList = [Order]()

    override func viewDidLoad() {
        super.viewDidLoad()
   
        sSwitch.setOn(false, animated: true)
        mSwitch.setOn(false, animated: true)
        lSwitch.setOn(false, animated: true)
        deliverySwitch.setOn(false, animated: true)
        subTotalLabel.text = "0.0"
       
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sSwitchTrigger(_ sender: UISwitch) {
        if(sender.isOn){
      
       
            let price:String?=smallText.text?.split(separator: "$")[1].description
            let smallPrice = price?.replacingOccurrences(of: ")", with: "",options: .literal, range: nil)
          
            subTotalLabel.text = smallPrice
            let totalTax:String = ((subTotalLabel.text! as NSString).doubleValue * 0.13).description
            taxLabel.text=totalTax
            let total:Double = (subTotalLabel.text! as NSString).doubleValue + (taxLabel.text! as NSString).doubleValue
            totalLabel.text = total.description
        }else{
            if !(mSwitch.isOn || lSwitch.isOn){
                subTotalLabel.text = ""
            }
               
        }
    }
    
    @IBAction func mSwitchTrigger(_ sender: UISwitch) {
        if(sender.isOn){
      
       
            let price:String?=mediumText.text?.split(separator: "$")[1].description
            let mediumPrice = price?.replacingOccurrences(of: ")", with: "",options: .literal, range: nil)
     
            subTotalLabel.text = mediumPrice
            let totalTax:String = ((subTotalLabel.text! as NSString).doubleValue * 0.13).description
            taxLabel.text=totalTax
            let total:Double = (subTotalLabel.text! as NSString).doubleValue + (taxLabel.text! as NSString).doubleValue
            totalLabel.text = total.description
            
        }else{
            if !(sSwitch.isOn || lSwitch.isOn){
                subTotalLabel.text = ""
            }
               
        }
        
    }
    
    @IBAction func lSwitchTrigger(_ sender: UISwitch) {
        if(sender.isOn){
 
       
            let price:String?=largeText.text?.split(separator: "$")[1].description
            let largePrice = price?.replacingOccurrences(of: ")", with: "",options: .literal, range: nil)
    
            subTotalLabel.text = largePrice
            let totalTax:String = ((subTotalLabel.text! as NSString).doubleValue * 0.13).description
            taxLabel.text=totalTax
            let total:Double = (subTotalLabel.text! as NSString).doubleValue + (taxLabel.text! as NSString).doubleValue
            totalLabel.text = total.description
        }else{
            if !(sSwitch.isOn || mSwitch.isOn){
                subTotalLabel.text = ""
            }
           
        }
    }
    
    
    @IBAction func checkoutListener(_ sender: UIButton) {
        let toppins:String = toppinsTextFiled.text!
        let delivery = deliverySwitch.isOn ? true:false
        
        if (!sSwitch.isOn && !mSwitch.isOn && !lSwitch.isOn){
            self.showToast(message: "Please Select Size", font: .systemFont(ofSize: 12.0),color: UIColor.red)
            return
        }
        if toppins.isEmpty{
            self.showToast(message: "Please Enter Toppins", font: .systemFont(ofSize: 12.0),color: UIColor.red)
            return
        }
    
        
        if(sSwitch.isOn && !mSwitch.isOn && !lSwitch.isOn){
            orderList.append(Order(size: "Small", toppings: toppins, delivery: delivery))
            self.showToast(message: "Order Added", font: .systemFont(ofSize: 12.0),color: UIColor.green)
            self.navigationController?.popViewController(animated: true)
        }else if (mSwitch.isOn && !sSwitch.isOn && !lSwitch.isOn){
            orderList.append(Order(size: "Medium", toppings: toppins, delivery: delivery))
            self.showToast(message: "Order Added", font: .systemFont(ofSize: 12.0),color: UIColor.green)
            self.navigationController?.popViewController(animated: true)
        }else if( lSwitch.isOn && !sSwitch.isOn && !mSwitch.isOn){
            orderList.append(Order(size: "Medium", toppings: toppins, delivery: delivery))
            self.showToast(message: "Order Added", font: .systemFont(ofSize: 12.0),color: UIColor.green)
            self.navigationController?.popViewController(animated: true) 
        }else{
            self.showToast(message: "Please select just one size", font: .systemFont(ofSize: 12.0),color: UIColor.red)
        }
        
    }
    
    func showToast(message : String, font: UIFont, color:UIColor) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = color.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
