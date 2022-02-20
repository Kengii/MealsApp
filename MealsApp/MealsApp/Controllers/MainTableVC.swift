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

    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
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
        let defaultCell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MainCustomTVC else { return defaultCell }
        let eat = DataM.shared.foods[indexPath.row]
        cell.nameLbl.text = eat.name
        cell.imageV.image = eat.image
        cell.priceLbl.text = String(eat.price) + "BYN"
        cell.ratingLbl?.text = eat.ratingStar

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
