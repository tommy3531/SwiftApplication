/*
 
     This was using a singleton to retrieve objects from realm using the realm service manager,
 
 */

import UIKit
import RealmSwift

class PropublicaViewController: UIViewController {
    
    // Propublica Model
    var propublicaModel: PropublicaModel = PropublicaModel()

    
    // Views
    var propublicaDetailPanel: PropublicaDetailPanel = PropublicaDetailPanel()
    var propublicaSocialPanel: PropublicaSocialPanel = PropublicaSocialPanel()
    var propublicaBasicInformation: PropublicaBasicInformation = PropublicaBasicInformation()
    
    // PropublicaClient
    var propublicaClient: PropublicaClient = PropublicaClient()
    
    // PropublicaManager - Managers Propublica Operations, makes rest call
    var propublicaManager: PropublicaManager = PropublicaManager()
    
    // RealmManager - Managers all Realm Operations
    var realmManager: RealmManager = RealmManager()
    
    // Computed property - tell realm to retrieve a PropublicaModel
    var legislators: Results<PropublicaModel>! {
        get {

            let realm = try! Realm()
            return realm.objects(PropublicaModel.self)
        }
    }

    // Should have a tableView loaded
    var tableView: UITableView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        //print(legislators)
        let frame = CGRect(x: 0, y: 0, width: 420, height: 1000)
        tableView = UITableView(frame: frame)
        tableView.dataSource = self
        tableView.delegate = self
        
        // Automatically size row
        tableView.estimatedRowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // Register our cell with the tableView and Add it the view as a subview
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
        
        
        // Cast a cell as a PublicaTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PublicaTableViewCell
        cell.selectionStyle = .none
        let backgroundView = UIView()
        
        // Set the backgroundView
        cell.selectedBackgroundView = backgroundView
        
        // If a cell is clicked get the legislators Info
        let legislatorProperty = legislators[indexPath.row]
        
        // Write data to the buttons
        cell.firstNameLabel.text = legislatorProperty.firstName
        cell.lastNameLabel.text = legislatorProperty.lastName
        cell.stateLabel.text = legislatorProperty.state
        return cell
    }
    
    // If a cell is selected send the data to the detailsViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Return a custom cell
//        let cell = tableView.cellForRow(at: indexPath) as! PublicaTableDetailCell
        
        let propublicaDetail = PropublicaDetailViewController()
        propublicaDetail.propublicaModel = legislators[indexPath.row]
        present(propublicaDetail, animated: true)
    }
}

extension PropublicaViewController: UITableViewDelegate {
    
}


