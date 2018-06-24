/*
 
 I manage all propublica objects
 
 
 */

import Foundation
import SwiftyJSON
import RealmSwift

struct PropublicaManager {
    
    var propublicClient: PropublicaClient = PropublicaClient()
    var propublicfileparser: PropublicaFileParser = PropublicaFileParser()
    var legislator = List<PropublicaModel>()
    
    // Completed return [PropublicaModel]
    func getSpecificCongressAndChamber(congress: String, chamber: String, completed: @escaping ([PropublicaModel]) -> ()) {
        
        // async return full jsonObject
        propublicClient.fetchCurrentSenateMembers(congress: congress, chamber: chamber) { (senateJSONObject) in
            
            //take json and parse
            self.propublicfileparser.parseSenate(json: senateJSONObject!, completed: { (propublicaArray) in
                completed(propublicaArray)
            })
        }
    }
    
    func getSpecificMember(memberId: String, completed: @escaping ([PropublicaSpecificMember]) -> ()) {
        
        propublicClient.fetchSpecificMember(memberId: memberId) { (specificJSONObject) in
            self.propublicfileparser.parseSpecificMember(json: specificJSONObject!, completed: {(specificArray) in
                completed(specificArray)
            })
        }
    }
    // call PropublicaClient function
}
