//
//  NewOrderViewController.swift
//  GroupHFinalProject
//
//  Created by Ertugrul on 2023-04-15.
//

import UIKit

class NewOrderViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
  
    

//    @IBOutlet weak var SideTableView: UITableView!
//    @IBOutlet weak var DrinkTableView: UITableView!
  
    @IBOutlet weak var drinkTableView: UITableView!
    @IBOutlet weak var sideTableView: UITableView!
    @IBOutlet weak var toppinsTableView: UITableView!
    @IBOutlet weak var sizeTableView: UITableView!
    
    var toppingList:[MenuItem] = []
    var sizeList:[MenuItem] = []
    var drinkList:[MenuItem] = []
    var sideList:[MenuItem] = []
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toppingList = MenuItem.toppingList
        sizeList = MenuItem.sizeList
        drinkList = MenuItem.drinkList
        sideList = MenuItem.sideList

        toppinsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "toppinsCell")
        toppinsTableView.dataSource = self
        toppinsTableView.delegate = self
        
        sizeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "sizeCell")
        sizeTableView.dataSource = self
        sizeTableView.delegate = self
        
        drinkTableView.register(UITableViewCell.self, forCellReuseIdentifier: "drinkCell")
        drinkTableView.dataSource = self
        drinkTableView.delegate = self
        
        sideTableView.register(UITableViewCell.self, forCellReuseIdentifier: "sideCell")
        sideTableView.dataSource = self
        sideTableView.delegate = self
    
        
       
        // Do any additional setup after loading the view.
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          // Return the number of items in the sample data structure.

                var numberOfRow = 1
               switch tableView {
               case toppinsTableView:
                   numberOfRow = toppingList.count
               case sizeTableView:
                   numberOfRow = sizeList.count
               case drinkTableView:
                   numberOfRow = drinkList.count
               case sideTableView:
                   numberOfRow = sideList.count
               default:
                   print("Some things Wrong!!")
               }
               return numberOfRow

      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

                var cell = UITableViewCell()
                 switch tableView {
                 case toppinsTableView:
                     cell = tableView.dequeueReusableCell(withIdentifier: "toppinsCell", for: indexPath) 
                     cell.textLabel?.text = toppingList[indexPath.row].name
//                     cell.nameLabel.text = ""
//                     cell.priceLabel.text = toppingList[indexPath.row].price
                  
                 case sizeTableView:
                     cell = tableView.dequeueReusableCell(withIdentifier: "sizeCell", for: indexPath)
                     cell.textLabel?.text = sizeList[indexPath.row].name
                 case drinkTableView:
                     cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath)
                     cell.textLabel?.text = drinkList[indexPath.row].name
                 case sideTableView:
                     cell = tableView.dequeueReusableCell(withIdentifier: "sideCell", for: indexPath)
                     cell.textLabel?.text = sideList[indexPath.row].name
                  
                 default:
                     print("Some things Wrong!!")
                 }
                 return cell
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
