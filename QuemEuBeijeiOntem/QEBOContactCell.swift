//
//  QEBOContactCell.swift
//  QuemEuBeijeiOntem
//
//  Created by Rafael Gonzalves on 07/05/17.
//  Copyright © 2017 Rafael Gonzalves. All rights reserved.
//

import UIKit
import APAddressBook

class QEBOContactCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contactNameLabel: UILabel!
    
    func setContact(contact : APContact)  {
        self.selectionStyle = UITableViewCellSelectionStyle.none
        if let name = contact.name {
            self.contactNameLabel.text = name.compositeName
        }
        if let recordDate = contact.recordDate {
            self.dateLabel.text =  timeAgoSince(recordDate.creationDate)
        }
    }
    
}
