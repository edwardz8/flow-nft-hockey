pub contract Tokenv1 {
    
    // declare NFT resource type
    pub resource SweaterTest {

        // unique id - how each nft is different from next
        pub let id: UInt64

        pub var metadata: { String: String }

        // initialize both fields in init function 

        init(initID: UInt64) {
            self.id = initID
            self.metadata = {}
        }
    }

    init() {
        self.account.save<@SweaterTest>(<-create SweaterTest(initID: 1), to: /storage/Sweater1)
    }
}