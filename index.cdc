pub contract Hello {
    pub let greeting: String 

    init() {
        self.greeting = "Hello Flow"
    }

    pub fun hello(): String {
        return self.greeting
    }
}