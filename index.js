class App{
    constructor(){
        this.express = require("express")
        this.app = null
    }

    init(){
        this.app = this.express()
        this.app.use(this.express.json())
        this.app.use(this.express.urlencoded({extended: false}))
        this.app.get("/", function(req, res){
            return res.status(200).json({
                active: true,
                port: process.env.PORT,
                env: process.env.NODE_ENV,
                namespace: process.env.NAMESPACE
            })
        })
    }

    start(){
        this.app.listen(process.env.PORT, function(){
            console.log(`Server ${process.env.NAMESPACE} on port: ${process.env.PORT}`)
        })
    }
}

class Main{
    static entrypoint(){
        const app = new App()
        app.init()
        app.start()
    }
}

Main.entrypoint()