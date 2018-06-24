/*
 
 This parses the all the data from the membersByState.json file
 
 */

import Foundation
import SwiftyJSON
import RealmSwift

class PropublicaFileParser {
    
    // Need a Empty legislator Object
    var propublicaModel: PropublicaModel!
    var legislator = List<PropublicaModel>()
    var propublicaArray = [PropublicaModel]()
    
    var propublicaSpecificMember: PropublicaSpecificMember!
    var propublicaSpecificMemberArray = [PropublicaSpecificMember]()
    var propublicaSpecificMemberArray2 = [PropublicaSpecificMember]()

    
    func parseSenate(json: JSON, completed: @escaping ([PropublicaModel]) -> ()) {

        
        if json["status"].stringValue == "OK" {
            //print("Good to parse JSON")
            // Loop through the results
            for result in (json["results"].arrayValue) {
                let legislatorInfo = result["members"].arrayValue
                for legislatorItem in legislatorInfo {
                    
                    // Get the firstName
                    let firstName = legislatorItem["first_name"].stringValue
                    
                    // Get the LastName
                    let lastName = legislatorItem["last_name"].stringValue
                    
                    // Get the state
                    let state = legislatorItem["state"].stringValue
                    
                    // Get the party
                    let party = legislatorItem["party"].stringValue
                    
                    // Get the legislator ID
                    let id = legislatorItem["id"].stringValue
                    
                    // Get the votesmart ID
                    let voteSmartID = legislatorItem["votesmart_id"].stringValue
                    
                    // Get the ocd_id
                    let ocdID = legislatorItem["ocd_id"].stringValue
                    
                    // Get the lis_id
                    let lisID = legislatorItem["lis_id"].stringValue
                    
                    // Get the fec_candidate_id
                    let fecCandidateID = legislatorItem["fec_candidate_id"].stringValue
                    
                    // Get the crp_id
                    let crpID = legislatorItem["crp_id"].stringValue
                    
                    // Get cspan_id
                    let cspanID = legislatorItem["cspan_id"].stringValue
                    
                    // Get the icpsr_id
                    let icpsrID = legislatorItem[""].stringValue
                    
                    // Get the govtrack_id
                    let govTrackID = legislatorItem["govtrack_id"].stringValue
                    
                    // Get the facebookAccount
                    let facebookAccount = legislatorItem["facebook_account"].stringValue
                    
                    // Get the youTubeAccount
                    let youtubeAccount = legislatorItem["youtube_account"].stringValue
                    
                    // Get the TwitterAccount
                    let twitterAccount = legislatorItem["twitter_account"].stringValue
                    
                    propublicaModel = PropublicaModel(firstname: firstName, lastname: lastName, state: state, party: party, id: id, votesmartid: voteSmartID, ocdid: ocdID, lisid: lisID, feccandidateid: fecCandidateID, crpid: crpID, cspanid: cspanID, icpsrid: icpsrID, govtrackid: govTrackID, facebookaccount: facebookAccount, youtubeaccount: youtubeAccount, twitteraccount: twitterAccount)
                    propublicaArray.append(propublicaModel)
                }
            }
            
            completed(propublicaArray)
            
            // TODO: Need to handle error
        } else {
            
        }
    }
    
    func parseSpecificMember(data: Data, completed: @escaping ([PropublicaSpecificMember]) -> ()) {
        print(JSON(data))
        do {
            let decoder = JSONDecoder()
            let root = try decoder.decode(PropublicaSpecificMember.self, from: data)
//            print(root)
            completed([root])

        } catch {
            print("error")
        }
        
    
            
//        if json["status"] == "OK" {
//            status = json["status"].stringValue
//            let propublicaSpecificMemberArray = json["results"]
////            print("Next level is Result Array")
//            for result in json["results"].arrayValue {
////                print("Inside Result Array: \(result)")
//                let voteSmart = result["votesmart_id"].stringValue
//                let cSpan = result["cspan_id"].stringValue
//                for role in result["roles"].arrayValue {
////                    print("Inside Roles Array: \(role)")
//                    let state = role["state"].stringValue
//                    let state_rank = role["state_rank"].stringValue
//
//                    for committee in role["committees"].arrayValue {
////                        print("Insdie Committees Array: \(committee)")
//                    }
//                    propublicaSpecificMember = PropublicaSpecificMember(status: status, results: propublicaSpecificMemberArray)
//                    propublicaSpecificMemberArray2.append(propublicaSpecificMember)
//
//                }
//
//            }
//            completed(propublicaSpecificMemberArray2)
//
//        } else {
//            print("SOmething went wrong")
//        }
    }

}
