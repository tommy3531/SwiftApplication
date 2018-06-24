/*
 
 Get data from PropublicaManager and put data in Realm backend
 
 */

import Foundation
import RealmSwift

struct RealmManager {
    
    // Congress number
    let congress = "115"
    let chamber = "senate"
    
    let memberId = "T000464"
    
    // Need to find a way to ask for user input
    
    // Get a reference to the PropublicaManager
    var propublicamanager = PropublicaManager()
    //var propublica:
    
    func loadAllSenator() {
        propublicamanager.getSpecificCongressAndChamber(congress: congress, chamber: chamber) { (propublicaSenateModel) in
            for senator in propublicaSenateModel {
                RealmService.shared.saveObjects(legislatorModel: senator)
            }
        }
    }
    
    // call PropublicaManager function
    func loadSpecificMember() {
        propublicamanager.getSpecificMember(memberId: memberId) { (propublicaSpecificMember) in
            for member in propublicaSpecificMember {
                print(member)
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


