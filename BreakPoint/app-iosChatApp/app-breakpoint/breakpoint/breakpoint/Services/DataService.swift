/*
 Create a new user in firebase
 Create private property to access firebase DB and individual path
 Control access to class properties by using public variable to access private properties
 */

import Foundation
import Firebase

// Access base URL of firebase DB
// https://breakpoint-d9ba2.firebaseio.com/
let DB_BASE = Database.database().reference()

class DataService {
    
    // Create an instance of DataService inside itself
    static let instance = DataService()
    
    // Create a private property to the DB
    private var _REF_BASE = DB_BASE
    
    // Create a private property to DB path called Users
    private var _REF_USER = DB_BASE.child("users")
    
    // Create a private property to DB path called groups
    private var _REF_GROUPS = DB_BASE.child("groups")
    
    // Create a private property to DB path called feed
    private var _REF_FEED = DB_BASE.child("feed")
    
    // Public variable access private variable and return DB Reference
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    // Public variable access private variable and return DB path reference to User
    var REF_USER: DatabaseReference {
        return _REF_USER
    }
    
    // Public variable access private variable and return DB path reference to Groups
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    // Public Variable access private variable and returnr DB path reference to Feed
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    // Create a firebase user
    // user
    //   - UID
    //      - userdata Dictionary
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USER.child(uid).updateChildValues(userData)
    }
    
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, sendComplete: @escaping (_ status: Bool) -> ()) {
        if groupKey != nil {
            REF_GROUPS.child(groupKey!).child("messages").childByAutoId().updateChildValues(["content": message, "senderId": uid])
            sendComplete(true)
        } else {
            REF_FEED.childByAutoId().updateChildValues(["content": message, "senderId": uid])
            sendComplete(true)
        }
    }
    
    func deleteMessage(senderID: String, userMessage: String, handler: @escaping (_ serverCode: Int) -> ()) {
        
        // Make sure data is comming for FeedVC tableView
        print("this is the senderID: \(senderID)")
        print("This is the message: \(userMessage)")
        
        // Get a reference to the Feed
        REF_FEED.observeSingleEvent(of: .value) { (messages) in
            
            // Retrieve Feed objects
            guard let feedMessageSnapShot = messages.children.allObjects as? [DataSnapshot] else { return }
            
            // Loop through the feeds
            for message in feedMessageSnapShot {
                
                // Get the message content and senderId
                let contentId = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                
                // Check if the DB has the data if
                if senderId == senderID && contentId == userMessage {
                    
                    print("We have a match")
                    print("This is the contentID Match: \(contentId)")
                    print("SenderID: \(senderID)")
                    print("This is the senderID Match: \(senderId)")
                    print("This is the message: \(message)")
                    
                    message.ref.removeValue()
                    handler(1)
                    return
                }
            }
            
            handler(0)
        }
    }
    
    func getUsername(forUID uid: String, handler: @escaping (_ username: String) ->()) {
        REF_USER.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapshot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    
    func getPic(userEmail: String, handler: @escaping (_ profilePic: [String]) ->()) {
        var picArray = [String]()

        // Get a reference to the user in the Database
        REF_USER.observe(.value) { (userSnapshot) in
            
            // Return all object of the user
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            // Loop through the snapshot
            for user in userSnapshot {
                
                // Go the email node
                let email = user.childSnapshot(forPath: "email").value as! String
                
                // Find the user email
                if email.contains(userEmail) == true {
                    
                    // Get the profile pic
                    let profilePic = user.childSnapshot(forPath: "profilePic").value as! String
                    picArray.append(profilePic)
                }
                handler(picArray)
            }
        }
    }
    
    func getUserPic(forUID uid: String, handler: @escaping (_ profilePic: String) ->()) {
        REF_USER.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapshot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "profilePic").value as! String)
                }
            }
        }
    }
    
    func getPicOfCurrentUser(email: String, handler: @escaping (_ profilePic: String) ->()) {
        // Get a reference to the users
        let userRef = REF_USER.child(Auth.auth().currentUser!.uid)
        print(userRef)
        // Update the profile image
        userRef.updateChildValues(["profilePic": UserDataService.instance.profilePic]) { (error, databaseReference) in
            if error == nil {
                print("this is good")
                print(databaseReference)
            } else {
                print(error?.localizedDescription)
            }
        }
    }

    func getEmail(forSearchQuery query: String, handler: @escaping (_ emailArray: [String]) ->()) {
        var emailArray = [String]()
        REF_USER.observe(.value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapshot {
                let email = user.childSnapshot(forPath: "email").value as! String
                if email.contains(query) == true && email != Auth.auth().currentUser?.email {
                    emailArray.append(email)
                }
            }
            handler(emailArray)
        }
    }
    
    func getIds(forUsernames usernames: [String], handler: @escaping (_ uidArray: [String]) -> ()) {
        REF_USER.observeSingleEvent(of: .value) { (userSnapShot) in
            var idArray = [String]()
            guard let userSnapShot = userSnapShot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapShot {
                let email = user.childSnapshot(forPath: "email").value as! String
                if usernames.contains(email){
                    idArray.append(user.key)
                }
            }
            handler(idArray)
        }
    }
    
    func getEmailsfor(group: Group, handler: @escaping (_ emailArray: [String]) ->()) {
        var emailArray = [String]()
        REF_USER.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapshot {
                if group.members.contains(user.key) {
                    let email = user.childSnapshot(forPath: "email").value as! String
                    emailArray.append(email)
                }
            }
            handler(emailArray)
        }
    }
    
    
    func getAllFeedMessages(handler: @escaping (_ messages: [Message]) -> ()) {
        var messageArray = [Message]()
        REF_FEED.observeSingleEvent(of: .value) { (feedMessageSnapShot) in
            guard let feedMessageSnapShot = feedMessageSnapShot.children.allObjects as? [DataSnapshot] else { return }
            for message in feedMessageSnapShot {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                let message = Message(content: content, senderId: senderId)
                messageArray.append(message)
            }
            handler(messageArray)
        }
    }
    
    func getAllMessagesFor(desiredGroup: Group, handler: @escaping (_ messagesArray: [Message]) -> ()) {
        var groupMessageArray = [Message]()
        REF_GROUPS.child(desiredGroup.key).child("messages").observeSingleEvent(of: .value) { (groupMessageSnapshot) in
            guard let groupMessageSnapshot = groupMessageSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for groupMessage in groupMessageSnapshot {
                let content = groupMessage.childSnapshot(forPath: "content").value as! String
                let senderId = groupMessage.childSnapshot(forPath: "senderId").value as! String
                let groupMessage = Message(content: content, senderId: senderId)
                groupMessageArray.append(groupMessage)
            }
            handler(groupMessageArray)
        }
    }
    
    func createGroup(withTitle title: String, andDescription description: String, forUserIds ids: [String], handler: @escaping (_ groupCreated: Bool) -> ()) {
        
        REF_GROUPS.childByAutoId().updateChildValues(["title": title, "description": description, "members": ids])
        // Error Check
        handler(true)
    }
    
    func getAllGroups(handler: @escaping (_ gropusArray: [Group]) ->()) {
        var groupsArray = [Group]()
        REF_GROUPS.observeSingleEvent(of: .value) { (groupSnapshot) in
            guard let groupSnapshot = groupSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for group in groupSnapshot {
                let memberArray = group.childSnapshot(forPath: "members").value as! [String]
                if memberArray.contains((Auth.auth().currentUser?.uid)!) {
                    let title = group.childSnapshot(forPath: "title").value as! String
                    let description = group.childSnapshot(forPath: "description").value as! String
                    let group = Group(title: title, description: description, key: group.key, members: memberArray, count: memberArray.count)
                    groupsArray.append(group)
                }
            }
            handler(groupsArray)
        }
    }
}

