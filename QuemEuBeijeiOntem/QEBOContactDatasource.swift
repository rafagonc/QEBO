//
//  QEBOContactDatasource.swift
//  QuemEuBeijeiOntem
//
//  Created by Rafael Gonzalves on 07/05/17.
//  Copyright © 2017 Rafael Gonzalves. All rights reserved.
//

import UIKit
import APAddressBook

class QEBOContactDatasource : NSObject, UITableViewDelegate, UITableViewDataSource {

    //MARK: Properties
    let contacts: [APContact]
        
    //MARK: Constructor
    init(contacts : [APContact]) {
        self.contacts = contacts;
    }
    
    //MARK: Table View Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "QEBOContactCell"
        var cell : QEBOContactCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? QEBOContactCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed(cellIdentifier, owner: self, options: nil)?.first as? QEBOContactCell
        }
        
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell?.setContact(contact: self.contacts[indexPath.row])
        
        return cell!
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
