// create_leagues.cdc

// This transaction creates new League & stores it in caller's account

import Hockeysphere from 0x01

transaction() {
    prepare(signer: AuthAccount) {
        
        // create a new League
        let newLeague <- Hockeysphere.createNewLeague(name: "Fully Torqued League")

        // save the League to account storage
        signer.save(<-newLeague, to: /storage/HockeysphereLeague)

        // link a public capability to the League
        signer.link<&Hockeysphere.League>(/public/HockeysphereLeague, target: /storage/HockeysphereLeague)
    }
}