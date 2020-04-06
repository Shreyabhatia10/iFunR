//
//  InterestingFactsViewController.swift
//  TestApp
//
//  Created by Shreya Bhatia on 04/12/19.
//  Copyright © 2019 Shreya Bhatia. All rights reserved.
//

import Foundation
import UIKit

class InterestingFactsDatasource {
    
}

class InterestingFactsViewController: ViewController {
    
    var interestingFacts: [InterestingFact] = []
    weak var datasource: InterestingFactsDatasource!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //        self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "funFactBackground")!)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 18.0)!]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        fetchData()
    }
    
}

// MARK:- Table view delegate and datasource functions
extension InterestingFactsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.interestingFacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "InterestingFact", for: indexPath) as? InterestingFactCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.factDetail.text = interestingFacts[indexPath.row].factDescription
        cell.didSetBorder()
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action: UITableViewRowAction, indexPath: IndexPath) -> Void in
            let deleteMenu = UIAlertController(title: nil, message: "Are you sure?", preferredStyle: .actionSheet)
            let deleteAction = UIAlertAction(title: "Delete", style: .default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            deleteMenu.addAction(deleteAction)
            deleteMenu.addAction(cancelAction)
            self.present(deleteMenu, animated: true, completion: nil)
        })
        return [deleteAction]
    }
}

// MARK:- Fetch data from JSON
extension InterestingFactsViewController {
    
    func fetchData() {

        guard let url = Bundle.main.url(forResource: "InterestingFacts", withExtension: "json"), let jsonData = try? Data(contentsOf: url) else { return }
        
        let jsonObject = try! JSONDecoder().decode([InterestingFact].self, from: jsonData)
        self.interestingFacts = jsonObject
        self.tableView.reloadData()
    }
}
