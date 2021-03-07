 // TEAM
    //
    // A team contains a roster of players that play in matches

    pub contract HockeysphereTeam {
        
        // emitted when new Team is created
        pub event NewTeamCreated(ID: UInt64, name: String)

        // emitted whenever Team name is changed
        pub event TeamNameUpdated(ID: UInt64, previousName: String, newName: String)

        // emitted when Player is added to a Team
        pub event PlayerAddedToTeam(teamID: UInt64, playerID: UInt64)

        // emitted whenever a Player is removed from a Team
        pub event PlayerRemovedFromTeam(teamID: UInt64, playerID: UInt64)

        pub resource Team {

            // each team has unique ID
            pub let ID: UInt64

            // team name
            pub var name: String

            // resource dictionary containing player NFT capabilities
            pub var roster: {UInt64: Capability?}

            init(ID: UInt64, name: String) {
                self.ID = ID
                self.name = name
                self.roster = {}

                emit NewTeamCreated(ID: ID, name: name)
            }

            // updateTeamName sets the Team name to the provided value
            pub fun updateTeamName(_ name: String) {
                
                // store the old name for the event
                let previousName = self.name
                
                // update the Team name
                self.name = name

                emit TeamNameUpdated(ID: self.ID, previousName: previousName, newName: name)
            }

            // addPlayerToTeam adds an Player's public capability to the Team roster
            //
            // - allows Player to participate in Team activities
            //
            pub fun addPlayerToTeam(ID: UInt64, playerCapability: Capability) {
                self.roster[ID] = playerCapability

                emit PlayerAddedToTeam(teamID: self.ID, playerID: ID)
            }

            // removePlayerFromTeam removes player's public capability from the Team roster
            //
            // - the Player can no longer participate in Team activities
            pub fun removePlayerFromTeam(ID: UInt64) {
                self.roster[ID] = nil

                emit PlayerRemovedFromTeam(teamID: self.ID, playerID: ID)
            }

            // getID returns the Team ID
            pub fun getID(): UInt64 {
                return self.ID
            }

            // getTeamName returns Team name
            pub fun getTeamName(): String {
                return self.name
            }

            // getPlayerIDs returns array of Player NFT IDs
            pub fun getPlayerIDs(): [UInt64] {
                return self.roster.keys
            }
        }

        init() {}
    }