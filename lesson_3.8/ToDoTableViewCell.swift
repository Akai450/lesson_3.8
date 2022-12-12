//
//  ToDoTableViewCell.swift
//  lesson_3.8
//
//  Created by Akai on 12/12/22.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    @IBOutlet weak var doneImageView: UIImageView!
    @IBOutlet weak var taskLabel: UILabel!
    
    var done = false
    
    override func layoutSubviews() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(isDone))
        doneImageView.addGestureRecognizer(tap)
    }

    @objc func isDone() {
        if done == false {
            doneImageView.image = UIImage(systemName: "checkmark.circle")
            done = true
        } else {
            doneImageView.image = UIImage(systemName: "circle")
            done = false
        }
    }
}
