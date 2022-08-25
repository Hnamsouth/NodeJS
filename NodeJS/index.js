const express = require('express')


const port = process.env.PORT || 4567

const app = express();

app.listen(port, () => {
    console.log("server running....!")
})

app.get("/", (req, res) => {
    res.send("hello nodejs")
})