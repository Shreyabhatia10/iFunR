//
//  ShortStoriesViewController.swift
//  TestApp
//
//  Created by Shreya Bhatia on 04/12/19.
//  Copyright © 2019 Shreya Bhatia. All rights reserved.
//

import Foundation
import UIKit

class ShortStoriesNavigationController: UINavigationController {
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        self.navigationItem.title = "Short stories"
//    }

}

class ShortStoriesDatasouce {
    
}

class ShortStoriesViewController: ViewController {
    
    var shortStories: [ShortStory] = [ShortStory]()
    
    weak var datasource: ShortStoriesDatasouce!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 18.0)!]
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Boom.png")!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.fetchData()
    }
}

// MARK:- Tableview delegate and datasource functions
extension ShortStoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shortStories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "ShortStories", for: indexPath) as? ShortStoriesCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.title.text = shortStories[indexPath.row].title
        cell.storyDescription.text = shortStories[indexPath.row].story
        cell.readFullStoryButton.tag = indexPath.row
        cell.readFullStoryButton.addTarget(self, action: #selector(self.buttonClicked(sender:)), for: .touchUpInside)
        cell.didSetBorder()
        return cell
    }
    
    @objc func buttonClicked(sender: UIButton) {
        let storyBoard = UIStoryboard.init(name: "ShortStories", bundle: Bundle.main)
        guard let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "ShortStoryDetailsPage") as? ShortStoryDetailsPage else { return }
        detailsViewController.shortStory = self.shortStories[sender.tag]
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
}

// MARK:- Fetch data from JSON
extension ShortStoriesViewController {
    
    func fetchData() {
        
        guard let url = Bundle.main.url(forResource: "ShortStories", withExtension: "json"), let jsonData = try? Data(contentsOf: url) else { return }
        
        let jsonObject = try! JSONDecoder().decode([ShortStory].self, from: jsonData)
        self.shortStories = jsonObject
        self.tableView.reloadData()
    }
}
