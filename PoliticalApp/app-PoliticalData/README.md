# app-PoliticalData
Building api client to consume rest data from Propublica and News Api

# Propublica Objects
- Propublica ViewController - Display Data from the propublica manager
- Propublica Model - Data representation of the JSON retrieved from the server
	- PropublicaModel - Mode to represent data returned from https://api.propublica.org/congress/v1/{congress}/{chamber}/members.json
	- PropublicaNewMemberModel - Model to represent data returned from https://api.propublica.org/congress/v1/members/new.json
	- PropublicaCurrentByStateMemberModel - Model to represent data returned from https://api.propublica.org/congress/v1/members/{chamber}/{state}/current.json
	- PropublicaMembersLeavingOfficeModel - Model to represent data returned from https://api.propublica.org/congress/v1/{congress}/{chamber}/members/leaving.json
	- PropublicaMemberVotePosition - Model to represent data returned from https://api.propublica.org/congress/v1/members/{member-id}/votes.json 
- Propublica Service - Build URL and makes requests to API
- Propublica Client - Gets the data from the propublica Service
- Propublica Parser - Parse the json retrieved from the request
- Propublica Managers - Is incharge of all propublica operations, used to display data on PropublicaViewController

# Realm Objects
- RealmService - After the data is parsed the saved as a PropublicaModel it is saved to the realm DB ??
- RealmManager - Gets the data from the propublicamanager and does query on the data that already exist in the realm DB ??


# News API Objects


# TODO
- Too much

# Completed
- App structure
- Propublica 
- Getting legislator firstName to show up in TableView 