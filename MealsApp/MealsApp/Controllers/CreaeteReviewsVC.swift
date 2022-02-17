//
//  CreaeteReviewsVC.swift
//  MealsApp
//
//  Created by Владимир Данилович on 16.02.22.
//

import UIKit

class CreaeteReviewsVC: UIViewController {
    
    var index = 0
    private var mark = 1.0
    
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var warningLbl:  UILabel!
    @IBOutlet weak var starControl: UISegmentedControl!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.isEnabled = false
        print(index)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func starCntrl(_ sender: UISegmentedControl) {
        if text.text.count <= 5 {
            warningLbl.isHidden = false
        } else {
            warningLbl.isHidden = true
            button.isEnabled = true
            mark += Double(sender.selectedSegmentIndex)
    }
    
    }
    @IBAction func saveReviews() {
        DataM.shared.foods[index].ratingArray.append(Reviews(text: text.text, mark: mark))
        dismiss(animated: true)
    }
    
}

