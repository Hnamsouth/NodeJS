//const express = require('express')
import express from 'express'


const port = process.env.PORT || 4567

const app = express();

app.listen(port, () => {
    console.log(`server running....${port}`)
})

app.get("/", (req, res) => {
    res.send("hello nodejs")
})