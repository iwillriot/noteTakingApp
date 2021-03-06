//
//  DetailViewController.swift
//  Plain Notes
//
//  Created by fakecardinal on 4/10/16.
//  Copyright © 2016 fakecardinal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UITextView!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        
        if objects.count == 0{
            return
        }
        
        if let label = self.detailDescriptionLabel {
            label.text = objects[currentIndex]
                if label.text == BLANK_NOTE{
                    label.text = ""
                }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //added this code WillRIOT
        detailViewController = self
        
        detailDescriptionLabel.becomeFirstResponder()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if objects.count == 0{
            return
        }
        
        objects[currentIndex] = detailDescriptionLabel.text
        
        if detailDescriptionLabel.text == "" {
            objects[currentIndex] = BLANK_NOTE
        }
        saveAndUpdate()
    }
    
    func saveAndUpdate(){
        masterView?.save()
        masterView?.tableView.reloadData()
    }
    
}

