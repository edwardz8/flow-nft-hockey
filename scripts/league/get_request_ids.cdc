// get_request_ids.cdc

// returns an array of Team IDs that have requested to register to the League

import Hockeysphere from 0x01

pub fun main(account: Address) {

    let account = getAccount(account)

    let leagueCapability = account.getCapability(/public/HockeysphereLeague)

    let leagueReference = leagueCapability?.borrow<&Hockeysphere.League>()
    ?? panic("unable to borrow the League reference")

    log(leagueReference!.getRequestIDs())
}