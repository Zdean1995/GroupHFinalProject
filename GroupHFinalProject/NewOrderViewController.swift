//
//  NewOrderViewController.swift
//  GroupHFinalProject
//
//  Created by Ertugrul on 2023-04-15.
//

import UIKit
import CoreData

class NewOrderViewController: UIViewController {
    
    @IBOutlet weak var deliverySwitch: UISwitch!
    @IBOutlet weak var smallText: UILabel!
    
    @IBOutlet weak var largeText: UILabel!
    @IBOutlet weak var mediumText: UILabel!
    @IBOutlet weak var toppinsTextFiled: UITextField!
    @IBOutlet weak var sSwitch: UISwitch!
    @IBOutlet weak var mSwitch: UISwitch!
    @IBOutlet weak var lSwitch: UISwitch!
    
    @IBOutlet weak var subTotalLabel: UILabel!
    
    @IBOutlet weak var taxLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    var order = Order(size: "Small", toppings: "", delivery: false)
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //the set up for the view items.  Small has been set as the default since it's the first option
        sSwitch.setOn(true, animated: true)
        mSwitch.setOn(false, animated: true)
        lSwitch.setOn(false, animated: true)
        deliverySwitch.setOn(false, animated: true)
        getPrice()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    //the switches for the sizes.  Choosing one sets the others to false
    @IBAction func sSwitchTrigger(_ sender: UISwitch) {
        order.size = "Small"
        lSwitch.setOn(false, animated: true)
        mSwitch.setOn(false, animated: true)
        sSwitch.isEnabled = false
        lSwitch.isEnabled = true
        mSwitch.isEnabled = true
        getPrice()
    }
    
    @IBAction func mSwitchTrigger(_ sender: UISwitch) {
        order.size = "Medium"
        sSwitch.setOn(false, animated: true)
        lSwitch.setOn(false, animated: true)
        mSwitch.isEnabled = false
        sSwitch.isEnabled = true
        lSwitch.isEnabled = true
        getPrice()
        
    }
    
    @IBAction func lSwitchTrigger(_ sender: UISwitch) {
        order.size = "Large"
        sSwitch.setOn(false, animated: true)
        mSwitch.setOn(false, animated: true)
        lSwitch.isEnabled = false
        sSwitch.isEnabled = true
        mSwitch.isEnabled = true
        getPrice()
    }
    
    //the switch for the delivery option
    @IBAction func dSwitchTrigger(_ sender: UISwitch) {
        if(sender.isOn){
            order.delivery = true
        }else{
            order.delivery = false
        }
        getPrice()
    }
    
    //the function for the checkout button.  When pressed it saves the order to the core data based on the order then redirects to the previous orders view
    @IBAction func checkOutListener(_ sender: UIButton) {
        if (!sSwitch.isOn && !mSwitch.isOn && !lSwitch.isOn){
            self.showToast(message: "Please Select Size", font: .systemFont(ofSize: 12.0),color: UIColor.red)
            return
        } else{
            if (!toppinsTextFiled.hasText){
                order.toppings = "Nothing"
            } else {
                order.toppings = toppinsTextFiled.text!
            }
            let prevOrder = PrevOrder(context: context)
            prevOrder.size = order.size
            prevOrder.toppings = order.toppings
            prevOrder.delivery = order.delivery
            prevOrder.price = "$" + String(format: "%.2f", order.calculateTotalPriceWithTax())
            do {
                try context.save()
                
            }
            catch{
                self.showToast(message: "Can't connect to core data", font: .systemFont(ofSize: 12.0),color: UIColor.red)
            }
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
    
    //the function for updating the view to reflect the price of the order
    func getPrice() {
        subTotalLabel.text = "$" + String(format: "%.2f", order.calculateTotalPrice())
        taxLabel.text = "$" + String(format: "%.2f", order.calculateTax())
        totalLabel.text = "$" + String(format: "%.2f", order.calculateTotalPriceWithTax())
    }
}
