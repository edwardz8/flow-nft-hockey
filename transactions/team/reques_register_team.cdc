// request_register_team.cdc

// Registers Team to a League

import Hockeysphere from 0x01

transaction() {
    prepare(signer: AuthAccount) {

        // get the public capability for the Team from storage
        let teamCapability = signer.getCapability(/public/HockeysphereTeam)

        // borrow a reference to the League from storage
        let leagueReference = signer.borrow<&Hockeysphere.League>(from: /storage/HockeysphereLeague)
        ?? panic ("could not borrow league capability")

        // register the Team to the League
        leagueReference.registerTeam(teamCapability: teamCapability!)
    }
}