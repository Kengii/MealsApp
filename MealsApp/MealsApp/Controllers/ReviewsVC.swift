//
//  CreateReviewsVC.swift
//  MealsApp
//
//  Created by Владимир Данилович on 16.02.22.
//

import UIKit

class ReviewsVC: UITableViewController {

    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataM.shared.foods[index].ratingArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell(style: .default, reuseIdentifier: "Cell1")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as? CustomTVC else { return defaultCell }
        let reviews = DataM.shared.foods[index].ratingArray

        cell.dateLbl.text = reviews[indexPath.row].dateStr
        cell.ratingLbl.text = reviews[indexPath.row].rating
        cell.textLbl.text = reviews[indexPath.row].text

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
