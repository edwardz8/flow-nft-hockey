// create_team.cdc
//
// This transaction creates a new Team and stores it
// in the caller's account
//

import Hockeysphere from 0x01

transaction() {
    prepare(signer: AuthAccount) {
        
        // create a new Team
        let newTeam <- Hockeysphere.createNewTeam(teamName: "Nippers")

        // save the Team to account storage
        signer.save(<-newTeam, to: /storage/HockeysphereTeam)

        // link a public capability to the Team
        signer.link<&Hockeysphere.Team>(/public/HockeysphereTeam, target: /storage/HockeysphereTeam)
    }
}