/*
 
     This was using a singleton to retrieve objects from realm using the realm service manager,
 
 */

import UIKit
import RealmSwift

class PropublicaViewController: UIViewController {
    
    var legislators: Results<PropublicaModel>! {
        get {
            
            let realm = try! Realm()
            return realm.objects(PropublicaModel.self)
        }
    }

    var tableView: UITableView!
    
    // Notifier viewController that the view will be added to view heriarchey
    override func viewWillAppear(_ animated: Bool) {
        <#code#>
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        let frame = CGRect(x: 0, y: 0, width: 420, height: 400)
        tableView = UITableView(frame: frame)
        tableView.dataSource = self
        tableView.delegate = self
        
        // Automatically size row
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Register PublicaTableViewCell with TableView
        tableView.register(PublicaTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
    }
}

// MARK: - UITableViewDataSource
extension PropublicaViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return legislators.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        // Ask TableView for a reusable cell and cast as a PublicaTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PublicaTableViewCell
        cell.selectionStyle = .none
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.red
        cell.selectedBackgroundView = backgroundView
        let legislatorModel = legislators[indexPath.row]
        cell.firstNameLabel.text = legislatorModel.firstName
        cell.lastNameLabel.text = legislatorModel.lastName
        return cell
    }
}

extension PropublicaViewController: UITableViewDelegate {
    
}


    

    
//    func do_table_refresh()
//    {
//        DispatchQueue.async(group: dispatch_get_main_queue(), execute: {
//            self.tableView.reloadData()
//            return
//        })
//    }

