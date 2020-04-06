//
//  ShortStoryDetailsPage.swift
//  TestApp
//
//  Created by Shreya Bhatia on 06/03/20.
//  Copyright © 2020 Shreya Bhatia. All rights reserved.
//

import Foundation
import UIKit

class ShortStoryDetailsPage: UIViewController {
    
    var shortStory: ShortStory?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var storyContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.didSetBorderForScrollView()
        self.didSetData()
    }
    
    // To set initial values for labels
    func didSetData() {
        self.storyTitle.text = shortStory?.title
        self.storyContent.text = shortStory?.story
    }
    
    func didSetBorderForScrollView() {
        self.scrollView.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.scrollView.layer.shadowColor = UIColor.black.cgColor
        self.scrollView.layer.shadowRadius = 4
        self.scrollView.layer.shadowOpacity = 0.25
        self.scrollView.layer.masksToBounds = false
        self.scrollView.clipsToBounds = false
    }
}

// MARK:- Scroll view delegates
extension ShortStoryDetailsPage: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var offsetValue = CGFloat()
        guard let navBarHeight = (self.navigationController?.navigationBar.frame.height) else {
            return
        }
        offsetValue = max(scrollView.contentOffset.y + navBarHeight, -2)
        if offsetValue > 100 {
            self.storyTitle.text = ""
            self.navigationItem.title = shortStory?.title
        } else {
            self.navigationItem.titleView?.frame.origin.y = offsetValue
            self.storyTitle.text = shortStory?.title
            self.storyTitle.adjustsFontSizeToFitWidth = true
            self.navigationItem.title = ""
        }
    }
}
