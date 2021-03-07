// approve_register_team.cdc
// Registers a team to a League

import Hockeysphere from 0x01

transaction() {
    prepare(signer: AuthAccount) {

        // borrow a reference to the League from storage
        let leagueReference = signer.borrow<&Hockeysphere.League>(from: /storage/HockeysphereLeague)
        ?? panic ("could not borrow league capability")

        // registers Team to the League
        leagueReference.approveRegisterTeam(teamID: UInt64(0))
    }
}