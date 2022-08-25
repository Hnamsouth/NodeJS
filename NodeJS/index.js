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
        // console.log(feilds)
});
app.get("/api2", (req, res) => {
    var qr2 = 'select * from class'
    con.query(qr2, (err, data) => {
        res.send(data)
    })
});


app.get("/sl-hs-moilop", (req, res) => {
    var qr3 = 'SELECT count(*) as slHS,class.NAME as Class FROM `students` join class on students.ClassID=class.id group by class.id';
    con.query(qr3, (err, data) => {
        if (err) res.send("erro get data");
        res.send(data)
    })
})
app.get("/chonHS", (req, res) => {
    var qr4 = 'select * from students where STN_Name = ?';
    con.query(qr4, ['hoc sinh 1'], (err, data) => {
        if (err) res.send("erro get data");
        res.send(data)
    })
})