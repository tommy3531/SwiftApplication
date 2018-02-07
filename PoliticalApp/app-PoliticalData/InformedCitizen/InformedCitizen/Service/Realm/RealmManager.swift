/*
 
 Get data from PropublicaManager and put data in Realm backend
 
 */

import Foundation
import RealmSwift

struct RealmManager {
    
    // Congress number
    var congress = "115"
    var chamber = "senate"
    
    // Get a reference to the PropublicaManager
    var propublicamanager: PropublicaManager = PropublicaManager()
    //var propublica:
    
    func loadAllSenator() {
        propublicamanager.getJsonFromClientTest(congress: congress, chamber: chamber) { (propublicaSenateModel) in
            for senator in propublicaSenateModel {
                RealmService.shared.saveObjects(legislatorModel: senator)
            }
        }
    }
    
    func getAllSenator() -> Results<Object> {
        loadAllSenator()
        let legislator = RealmService.shared.getObjects(type: PropublicaModel.self)
        return legislator!
        //print(legislator)
    }
}


