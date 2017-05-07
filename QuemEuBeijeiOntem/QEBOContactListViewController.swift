//
//  QEBOContactListViewController.swift
//  QuemEuBeijeiOntem
//
//  Created by Rafael Gonzalves on 07/05/17.
//  Copyright © 2017 Rafael Gonzalves. All rights reserved.
//

import UIKit

class QEBOContactListViewController: UIViewController {

    //MARK: Properties
    var tableViewDatasourceAndDelegate : QEBOContactDatasource?
    var contactDataAccessObject : QEBOContactDataAccessObject

    //MARK: UI
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: Constructor
    init() {
        self.contactDataAccessObject = QEBOContactDataAccessObject()
        super.init(nibName: "QEBOContactListViewController", bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        self.contactDataAccessObject = QEBOContactDataAccessObject()
        super.init(coder: aDecoder)
    }
    

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityIndicator.startAnimating()
        self.tableView.alpha = 0;
        self.contactDataAccessObject.contactsSortedByCreationDate { (contacts, error) in
            self.activityIndicator.stopAnimating()
            UIView.animate(withDuration: 0.3, animations: { 
                self.tableView.alpha = 1;
            })
            if let err = error {
                UIAlertView.init(title: "Erro", message: (err.localizedDescription), delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: "").show()
            }
            if let contactList = contacts {
                self.tableViewDatasourceAndDelegate = QEBOContactDatasource(contacts : contactList)
                self.tableView.dataSource = self.tableViewDatasourceAndDelegate
                self.tableView.delegate = self.tableViewDatasourceAndDelegate
                self.tableView.reloadData()
            }
            
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let imageView : UIImageView = UIImageView(image : UIImage.init(named: "heart"))
        imageView.frame = CGRect.init(x: 0, y: 0, width: 20, height: 20)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView;

        
        if let nav = self.navigationController {
            nav.navigationBar.shadowImage = UIImage()
            nav.navigationBar.barTintColor = UIColor.white
        }
        
    }

}
