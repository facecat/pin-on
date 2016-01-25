//
//  ViewController.swift
//  pin-on
//
//  Created by 邱国邦 on 16/1/12.
//  Copyright © 2016年 FaceCat. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var posts = [poPost]()
    
    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
        
        recieveFirebaseData()
    }

    //talk to firebase data
    func recieveFirebaseData() {
        DataService.sharedDataSvc.REF_POSTS.observeEventType(.Value) { (snapshot: FDataSnapshot!) -> Void in

            //clear old data
            self.posts = []

            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                for snap in snapshots {
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        print(snap.key)
                        
                        let post = poPost(key: key, dict: postDict)
                        self.posts.append(post)
                    }
                }
            }
        }
        tableview.reloadData()
    }
    
    //MARK: UITableViewDataSource & UITableViewDelegate
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostCell
    }

    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
}













