// The main Hockeysphere contract

// This smart contract manages global state for the Hockeysphere

// TODO: Explain sports and league creation once prototyped

// TODO: Add Collections for League and Team resource - are they NFTs or just similar resources?
pub contract Hockeysphere {

    // emitted when contract is initialized
    pub event HockeysphereInitialized(totalLeagues: UInt64, totalTeams: UInt64)

    // totalLeagues represents the total number of Leagues that have been created
    access(contract) var totalLeagues: UInt64

    // totalTeams represents the total number of Teams that have been created
    access(contract) var totalTeams: UInt64

    // TODO: Update Flow CLI to version that supports Enums
    // sports is an Enum representing the available sport types - used to determine equipment type
    // pub var sports: Enum

    // commissioners is a dictionary mapping each league ID to its owner's Flow address
    //
    // - Leagues are a resource that will be stored in the commissioner's account storage,
    // so we need an easy way to find out where each league is stored. 
    access(contract) var commissioners: {UInt64: Address}

    // teamOwners is a dictionary that maps each team ID to its owner's Flow address
    //
    // - Teams are a resource that will be stored in the owner's account storage,
    // so we need an easy way to find out where each team is stored. 
    pub var teamOwners: {UInt64: Address}
    
    // TODO: This should be 'admin only' - could make this something users need to
    // 'unlock' via purchase, or by committing their initial prize Vault to prevent
    // spam League creation
    // 
    // createNewLeague creates a new League resource and returns it to the caller
    pub fun createNewLeague(name: String): @HockeysphereLeague.League {
        
        // set league ID to the total number of leagues
        let ID = Hockeysphere.totalLeagues

        // increment total number of leagues by one
        Hockeysphere.totalLeagues = Hockeysphere.totalLeagues + 1 as UInt64

        // return newly created League
        return <- create HockeysphereLeague.League(ID: ID, name: name)
    }

    // createNewTeam creates a new Team resource and returns it to the caller
    pub fun createNewTeam(teamName: String): @HockeysphereTeam.Team {
        
        // set the total Teams count as the teamID
        let teamID = Hockeysphere.totalTeams

        // increment the totalTeams count by one
        Hockeysphere.totalTeams = Hockeysphere.totalTeams + 1 as UInt64
        
        // return the new Team to the caller
        return <- create HockeysphereTeam.Team(ID: teamID, name: teamName)
    }

    init() {
        // Initialize contract with no Leagues or Teams
        self.totalLeagues = 0
        self.totalTeams = 0

        self.commissioners = {}
        self.teamOwners = {}

        emit HockeysphereInitialized(totalLeagues: self.totalLeagues, totalTeams: self.totalTeams)
    }
}