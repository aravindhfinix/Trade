const express = require('express')
const mongoose = require('mongoose');
const tradeRouter = require('./src/routes/trade-rotues');
const app = express()

mongoose.connect('mongodb://localhost/trading').then(response=>{
    console.log('mongoose connected successfully')
})

app.use(express.urlencoded({ limit: '50mb', extended: true }));

app.use('/api/v1/trade', tradeRouter)

/**
 * 404 not found exception handler
 */
app.use((req, res, next) => {
    return res.send('Requested route not found', 404);
});

app.listen(5000, () => { console.log('sever started on port 5000') })