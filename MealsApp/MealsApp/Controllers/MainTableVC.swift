//
//  MainTableVC.swift
//  MealsApp
//
//  Created by Владимир Данилович on 16.02.22.
//

import UIKit

class MainTableVC: UITableViewController {

    var foodIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataM.shared.foods.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let eat = DataM.shared.foods[indexPath.row]
        cell.textLabel?.text = eat.name
        cell.imageView?.image = eat.image
        cell.detailTextLabel?.text = String(eat.price)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
             return 80
         }



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let detailVC = segue.destination as? DetailVC else { return }
        detailVC.currentFood = DataM.shared.foods[indexPath.row]
        detailVC.navigationItem.title = DataM.shared.foods[indexPath.row].name
        detailVC.foodIndex = indexPath.row
        

    }
}
