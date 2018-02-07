// API Key: SpzjlPZlkMlPKKGCLQS1OqZtCN96lPl7sszOTKra

// List of Members Endpoint
// https://api.propublica.org/congress/v1/{congress}/{chamber}/members.json
// congress: 102-115 for house & 80-115 Senate
// chamber: house or senate

// Get a specific Member
// https://api.propublica.org/congress/v1/members/{member-id}.json
// member-id: The iD of the members retrieved

// Get Current Members by State/District
// GET https://api.propublica.org/congress/v1/members/{chamber}/{state}/current.json
// Chamber: house or senate
// Two digit state

import Foundation
import SwiftyJSON

struct PropublicaClient {
    
    var propublicaServiceAPI: PropublicaServiceAPI = PropublicaServiceAPI()
    
    // Request the current senate members from the Propublica Service
    // TODO: I dont like how I am passing congress and chamber 
    func requestCurrentSenateMembers(congress: String, chamber: String, completed: @escaping (JSON?) -> ()) {
        propublicaServiceAPI.getCurrentMembersOfSenate(congress: congress, chamber: chamber) { (jsonFromClient) in
            completed(jsonFromClient)
        }
    }
}
