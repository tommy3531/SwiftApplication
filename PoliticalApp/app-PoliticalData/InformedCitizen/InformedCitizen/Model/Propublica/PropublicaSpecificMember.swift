//
//  PropublicaNewMember.swift
//  InformedCitizen
//
//  Created by Tom Marler on 2/1/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers final class PropublicaSpecificMember: Object {
    
    dynamic var status: String? = nil
    var results = List<Result>()
    
    override public static func primaryKey() -> String? {
        return "status"
    }
    
    enum PropublicaSpecificMemberKeys: String, CodingKey {
        case status
        case results
    }
}
    
@objcMembers final class Result: Object {

    dynamic var votesmart_id: String = ""
    dynamic var cspan_id: String = ""
//    var roles: [Role] = []
//    var crp_id: String?
//    var icpsr_id: String?
//    var facebook_account: String?
//    var youtube_account: String?
//    var twitter_account: String?
    
    override public static func primaryKey() -> String? {
        return "votesmart_id"
    }

    enum ResultKeys: String, CodingKey {
        case votesmart_id
        case cspan_id
//        case roles
//        case crp_id
//        case icpsr_id
//        case facebook_account
//        case youtube_account
//        case twitter_account
    }
}

struct Role {
    var state: String?
    var state_rank: String?
    var committees: [Committee]

    enum RoleKeys: String, CodingKey {
        case state
        case state_rank
        case committees
    }
    
    struct Committee {
        var end_date: String
        var name: String
        
        enum CommitteeKeys: String, CodingKey {
            case end_date
            case name
        }
    }
}


extension PropublicaSpecificMember: Decodable {
    convenience init(from decoder: Decoder) throws {
        self.init()
        let rootContainer = try decoder.container(keyedBy: PropublicaSpecificMemberKeys.self)
        self.status = try rootContainer.decode(String.self, forKey: .status)
        let resultArray = try rootContainer.decode([Result].self, forKey: .results)
        self.results = List<Result>()
        results.append(objectsIn: resultArray)
        
    }
}

extension Result: Decodable {
    convenience init(from decoder: Decoder) throws {
        self.init()
        let resultContainer = try decoder.container(keyedBy: ResultKeys.self)
        self.votesmart_id = (try resultContainer.decodeIfPresent(String.self, forKey: .votesmart_id))!
        self.cspan_id = (try resultContainer.decodeIfPresent(String.self, forKey: .cspan_id))!
//        roles = try resultContainer.decode([Role].self, forKey: .roles)
//        icpsr_id = try resultContainer.decodeIfPresent(String.self, forKey: .icpsr_id)
//        facebook_account = try resultContainer.decodeIfPresent(String.self, forKey: .facebook_account)
//        youtube_account = try resultContainer.decodeIfPresent(String.self, forKey: .youtube_account)
//        twitter_account = try resultContainer.decodeIfPresent(String.self, forKey: .twitter_account)
    }
}
//
//extension Role: Decodable {
//    init(from decoder: Decoder) throws {
//        let roleContainer = try decoder.container(keyedBy: RoleKeys.self)
//        state = try roleContainer.decode(String.self, forKey: .state)
//        state_rank = try roleContainer.decode(String.self, forKey: .state_rank)
//        committees = try roleContainer.decodeIfPresent([Committee].self, forKey: .committees) as! [Role.Committee]
//
//    }
//}
//
//extension Role.Committee: Decodable {
//    init(from decoder: Decoder) throws {
//        let committeeContainer = try decoder.container(keyedBy: CommitteeKeys.self)
//        end_date = (try committeeContainer.decodeIfPresent(String.self, forKey: .end_date))!
//        name = (try committeeContainer.decodeIfPresent(String.self, forKey: .name))!
//    }
//}


