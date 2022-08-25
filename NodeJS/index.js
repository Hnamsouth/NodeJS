//const express = require('express')
import express from 'express'
import mysql from 'mysql2'


const port = process.env.PORT || 4567
const app = express();

const con = mysql.createConnection({
    host: "127.0.0.1",
    user: "root",
    database: "test"
})

// create
app.listen(port, () => {
    console.log(`server running....${port}`)
})
app.get("/", (req, res) => {
    res.send("hello nodejs")
})

var qr1 = 'select * from class join students on students.ClassID= class.id'

con.query(qr1, (err, data, feilds) => {
    app.get("/api1", (req, res) => {
            if (err) res.send('Error..!!')
            res.json(data)
        })
        //console.table(data)
        //console.log(data)
})
app.get("/api2", (req, res) => {
    con.query(`select * from students`, (err, data) => {
        res.send(data)
    })
})