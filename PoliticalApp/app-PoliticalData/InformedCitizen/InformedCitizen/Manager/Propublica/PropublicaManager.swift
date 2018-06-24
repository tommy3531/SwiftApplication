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
    
    // Get array of SpecificMember
    func getSpecificMember(memberId: String, completed: @escaping ([PropublicaSpecificMember]) -> ()) {
        
        // Fetch member by MemberId and jsonObject
        propublicClient.fetchSpecificMember(memberId: memberId) { (specificJSONObject) in
            
            // Parse jsonObject return array
            self.propublicfileparser.parseSpecificMember(data: specificJSONObject!, completed: {(specificArray) in
                completed(specificArray)
            })
        }
    }
    // call PropublicaClient function
}
