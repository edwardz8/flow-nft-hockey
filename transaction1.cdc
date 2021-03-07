import Tokenv1 from 0x01cf0e2f2f715450

// This transaction checks if an NFT exists in the storage of the given account
// by trying to borrow from it
transaction {
    prepare(acct: AuthAccount) {
        if acct.borrow<&Tokenv1.SweaterTest>(from: /storage/Sweater1) != nil {
            log("The token exists!")
        } else {
            log("No token found!")
        }
    }
}