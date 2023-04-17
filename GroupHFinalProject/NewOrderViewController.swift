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
    //    @IBOutlet weak var SideTableView: UITableView!
//    @IBOutlet weak var DrinkTableView: UITableView!
  
    @IBOutlet weak var subTotalLabel: UILabel!
    
    @IBOutlet weak var taxLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    
    var viewController:ViewController!
    
    var order = Order(size: "", toppings: "", delivery: false)
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        sSwitch.setOn(false, animated: true)
        mSwitch.setOn(false, animated: true)
        lSwitch.setOn(false, animated: true)
        deliverySwitch.setOn(false, animated: true)
        subTotalLabel.text = "$0.00"
        taxLabel.text = "$0.00"
        totalLabel.text = "$0.00"
       
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
            
      }
    
    
    @IBAction func sSwitchTrigger(_ sender: UISwitch) {
        if(sender.isOn){
            order.size = "Small"
            mSwitch.setOn(false, animated: true)
            lSwitch.setOn(false, animated: true)
        }else{
            order.size = ""
        }
        getPrice()
    }
    
    @IBAction func mSwitchTrigger(_ sender: UISwitch) {
        if(sender.isOn){
            order.size = "Medium"
            sSwitch.setOn(false, animated: true)
            lSwitch.setOn(false, animated: true)
        }else{
            order.size = ""
               
        }
        getPrice()
        
    }
    
    @IBAction func lSwitchTrigger(_ sender: UISwitch) {
        if(sender.isOn){
            order.size = "Large"
            sSwitch.setOn(false, animated: true)
            mSwitch.setOn(false, animated: true)
        }else{
            order.size = ""
        }
        getPrice()
    }
    
    
    @IBAction func dSwitchTrigger(_ sender: UISwitch) {
        if(sender.isOn){
            order.delivery = true
        }else{
            order.delivery = false
        }
        getPrice()
    }
    
    
    @IBAction func checkOutListener(_ sender: UIButton) {
        if (!sSwitch.isOn && !mSwitch.isOn && !lSwitch.isOn){
            self.showToast(message: "Please Select Size", font: .systemFont(ofSize: 12.0),color: UIColor.red)
            return
        }
        if (!toppinsTextFiled.hasText){
            self.showToast(message: "Please Enter Toppings", font: .systemFont(ofSize: 12.0),color: UIColor.red)
            return
        } else {
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
    
    
   
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destVC = segue.destination as! ViewController
//        destVC.orders = orderList
//    }
    
    
    
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
    
    func getPrice() {
        subTotalLabel.text = "$" + String(format: "%.2f", order.calculateTotalPrice())
        taxLabel.text = "$" + String(format: "%.2f", order.calculateTax())
        totalLabel.text = "$" + String(format: "%.2f", order.calculateTotalPriceWithTax())
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
