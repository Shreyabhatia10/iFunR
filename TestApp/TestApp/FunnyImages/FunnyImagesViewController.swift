//
//  FunnyImagesViewController.swift
//  TestApp
//
//  Created by Shreya Bhatia on 04/12/19.
//  Copyright © 2019 Shreya Bhatia. All rights reserved.
//

import Foundation
import UIKit

class FunnyImagesDatasource {
    
}

class FunnyImagesViewController: ViewController {
    
    var funnyImages: [FunnyImage] = [FunnyImage]()
    
    weak var datasource: FunnyImagesDatasource!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 18.0)!]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.fetchData()
    }
    
}

// MARK:- Table view datasource and delegates functions
extension FunnyImagesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.funnyImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "FunnyImage", for: indexPath) as? FunnyImageCell else {
            return UITableViewCell()
        }
        cell.funnyImage.image = UIImage(named: funnyImages[indexPath.row].imageUrl)
        cell.imageTitle.text = funnyImages[indexPath.row].imageTitle
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.didSetBorder()
        return cell
    }
    
}

extension FunnyImagesViewController {
    
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "FunnyImages", withExtension: "json"), let jsonData = try? Data(contentsOf: url) else { return }
        
        let jsonObject = try! JSONDecoder().decode([FunnyImage].self, from: jsonData)
        self.funnyImages = jsonObject
        self.tableView.reloadData()
    }
}
