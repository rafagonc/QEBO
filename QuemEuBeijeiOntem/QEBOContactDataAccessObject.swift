//
//  QEBOContactDataAccessObject.swift
//  QuemEuBeijeiOntem
//
//  Created by Rafael Gonzalves on 07/05/17.
//  Copyright © 2017 Rafael Gonzalves. All rights reserved.
//

import Foundation
import APAddressBook

class QEBOContactDataAccessObject {
    
    func contactsSortedByCreationDate(callback :@escaping ([APContact]?,Error?) -> ())  {
        let addressBook = APAddressBook()
        addressBook.fieldsMask = [APContactField.name, APContactField.recordDate]
        addressBook.sortDescriptors = [NSSortDescriptor.init(key: "recordDate.creationDate", ascending: false)]
        addressBook.loadContacts { (contacts, error) in
            if let err = error {
                callback(contacts,err)
            }
            callback(contacts,nil)
        }
    }
    
    
}
