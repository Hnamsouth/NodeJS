import express from 'express'

const port = process.env.PORT || 5000

const app = express();

app.listen(port, () => {
    console.log("server running....!")
})

app.get("/", (req, res) => {
    res.send("hello nodejs")
})