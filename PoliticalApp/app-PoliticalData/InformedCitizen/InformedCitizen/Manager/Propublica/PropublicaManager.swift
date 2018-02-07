/*
 
 I manage all propublica objects
 
 
 */

import Foundation
import SwiftyJSON
import RealmSwift

struct PropublicaManager {
    
    var propublicclient: PropublicaClient = PropublicaClient()
    var propublicfileparser: PropublicaFileParser = PropublicaFileParser()
    var legislator = List<PropublicaModel>()
        
    func getJsonFromClientTest(congress: String, chamber: String, completed: @escaping ([PropublicaModel]) -> ()) {
        
        // Call the propublicclient
        propublicclient.requestCurrentSenateMembers(congress: congress, chamber: chamber) { (senateJSONObject) in
            
            // Parse the JSON into Propublica Model Object
            self.propublicfileparser.parseJSONFromClient(json: senateJSONObject!, completed: { (propublicaModel) in
                completed(propublicaModel)
            })
        }
    }
}
