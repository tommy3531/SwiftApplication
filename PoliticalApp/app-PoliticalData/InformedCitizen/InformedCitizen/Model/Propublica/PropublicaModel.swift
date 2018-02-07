/*
 
 This represents a legislator based off the Propublica API
 
 */

import Foundation
import RealmSwift

@objcMembers class PropublicaModel: Object {
    
    dynamic var firstName: String? = nil
    dynamic var lastName: String? = nil
    dynamic var state: String? = nil
    dynamic var party: String? = nil
    dynamic var id: String? = nil
    dynamic var voteSmartID: String? = nil
    dynamic var ocdID: String? = nil
    dynamic var lisID: String? = nil
    dynamic var fecCandidateID: String? = nil
    dynamic var crpID: String? = nil
    dynamic var cspanID: String? = nil
    dynamic var icpsrID: String? = nil
    dynamic var govTrackID: String? = nil
    dynamic var facebookAccount: String? = nil
    dynamic var youTubeAccount: String? = nil
    dynamic var twitterAccount: String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(firstname: String, lastname: String, state: String, party: String, id: String, votesmartid: String, ocdid: String, lisid: String, feccandidateid: String, crpid: String, cspanid: String, icpsrid: String, govtrackid: String, facebookaccount: String, youtubeaccount: String, twitteraccount: String) {

        self.init()
        self.firstName = firstname
        self.lastName = lastname
        self.state = state
        self.party = party
        self.id = id
        self.voteSmartID = votesmartid
        self.ocdID = ocdid
        self.lisID = lisid
        self.fecCandidateID = feccandidateid
        self.crpID = crpid
        self.cspanID = cspanid
        self.icpsrID = icpsrid
        self.govTrackID = govtrackid
        self.facebookAccount = facebookaccount
        self.youTubeAccount = youtubeaccount
        self.twitterAccount = twitteraccount
    }
}

