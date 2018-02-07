/*
 
 I am the PropublicaAPI service my job is build endpoints and return string
 
 */


// API Key: SpzjlPZlkMlPKKGCLQS1OqZtCN96lPl7sszOTKra

import Foundation
import Alamofire
import Networking
import SwiftyJSON


struct PropublicaServiceAPI {
    
    // https://api.propublica.org/congress/v1/{congress}/{chamber}/members.json
    func getCurrentMembersOfSenate(congress: String, chamber: String, completed: @escaping (JSON?) -> ()) {
        
        // TODO: URLComponents
        let networking = Networking(baseURL: "https://api.propublica.org/congress/v1/\(congress)/\(chamber)/members.json")
        networking.setAuthorizationHeader(headerKey: "x-api-key", headerValue: "SpzjlPZlkMlPKKGCLQS1OqZtCN96lPl7sszOTKra")
        networking.get("") { result in
            switch result {
            case .success(let response):
                let data = response.data
                let json = JSON(data)
                completed(json)
            case .failure(let response):

                // TODO: Need to handle the response
                print(response)
                return
            }
        }
    }
    
    // https://api.propublica.org/congress/v1/members/{member-id}.json
    // This get a a specific members from congress based from their memberID
    func getSpecificMember(memberID: String, completed: @escaping (JSON?) -> ()) {
        
        // Build Request
        let networking = Networking(baseURL: "https://api.propublica.org/congress/v1/members/\(memberID).json")
        networking.setAuthorizationHeader(headerKey: "x-api-key", headerValue: "SpzjlPZlkMlPKKGCLQS1OqZtCN96lPl7sszOTKra")
        networking.get("") { (result) in
            switch result {
            case .success(let response):
                let data = response.data
                let json = JSON(data)
                completed(json)
            case .failure(let response):
                
                // TODO: Need to handle the response
                print(response)
                return
            }
        }
    }
    
    // https://api.propublica.org/congress/v1/members/new.json
    func getNewMember(memberID: String, completed: @escaping (JSON?) -> ()) {
        
        // Build Request
        let networking = Networking(baseURL: "https://api.propublica.org/congress/v1/members/new.json")
        networking.setAuthorizationHeader(headerKey: "x-api-key", headerValue: "SpzjlPZlkMlPKKGCLQS1OqZtCN96lPl7sszOTKra")
        networking.get("") { (result) in
            switch result {
            case .success(let response):
                let data = response.data
                let json = JSON(data)
                completed(json)
            case .failure(let response):
                
                // TODO: Need to handle the response
                print(response)
                return
            }
        }
    }
    
    // https://api.propublica.org/congress/v1/members/{chamber}/{state}/current.json
    func getStateSenateMembers(chamber: String, state: String, completed: @escaping (JSON?) -> ()) {
        
        // Build Request
        let networking = Networking(baseURL: "https://api.propublica.org/congress/v1/members/\(chamber)/\(state)/current.json")
        networking.setAuthorizationHeader(headerKey: "x-api-key", headerValue: "SpzjlPZlkMlPKKGCLQS1OqZtCN96lPl7sszOTKra")
        networking.get("") { (result) in
            switch result {
            case .success(let response):
                let data = response.data
                let json = JSON(data)
                completed(json)
            case .failure(let response):
                
                // TODO: Need to handle the response
                print(response)
                return
            }
        }
    }
    
    // https://api.propublica.org/congress/v1/members/{chamber}/{state}/{district}/current.json
    func getStateHouseMembers(chamber: String, state: String, district: String, completed: @escaping (JSON?) -> ()) {
        
        // Build Request
        let networking = Networking(baseURL: "https://api.propublica.org/congress/v1/members/\(chamber)/\(state)/\(district)/current.json")
        networking.setAuthorizationHeader(headerKey: "x-api-key", headerValue: "SpzjlPZlkMlPKKGCLQS1OqZtCN96lPl7sszOTKra")
        networking.get("") { (result) in
            switch result {
            case .success(let response):
                let data = response.data
                let json = JSON(data)
                completed(json)
            case .failure(let response):
                
                // TODO: Need to handle the response
                print(response)
                return
            }
        }
    }
    
    // https://api.propublica.org/congress/v1/{congress}/{chamber}/members/leaving.json
    func getMembersLeavingOffice(congress: String, chamber: String, completed: @escaping (JSON?) -> ()) {
        
        // Build Request
        let networking = Networking(baseURL: "https://api.propublica.org/congress/v1/\(congress)/\(chamber)/members/leaving.json")
        networking.setAuthorizationHeader(headerKey: "x-api-key", headerValue: "SpzjlPZlkMlPKKGCLQS1OqZtCN96lPl7sszOTKra")
        networking.get("") { (result) in
            switch result {
            case .success(let response):
                let data = response.data
                let json = JSON(data)
                completed(json)
            case .failure(let response):
                
                // TODO: Need to handle the response
                print(response)
                return
            }
        }
    }
    
    // https://api.propublica.org/congress/v1/members/{member-id}/bills/{type}.json
    // PARAM: memberID - Assigned by BIO Directory US Congress
    // PARAM: type - cosponsored or withdrawn
    func getBillOfSpecificMember(memberID: String, type: String, completed: @escaping (JSON?) -> ()) {
        // Build Request
        let networking = Networking(baseURL: "https://api.propublica.org/congress/v1/members/\(memberID)/bills/\(type).json")
        networking.setAuthorizationHeader(headerKey: "x-api-key", headerValue: "SpzjlPZlkMlPKKGCLQS1OqZtCN96lPl7sszOTKra")
        networking.get("") { (result) in
            switch result {
            case .success(let response):
                let data = response.data
                let json = JSON(data)
                completed(json)
            case .failure(let response):
                
                // TODO: Need to handle the response
                print(response)
                return
            }
        }
    }
}






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
