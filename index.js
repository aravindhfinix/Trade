const express = require('express')
const mongoose = require('mongoose');
const tradeRouter = require('./src/routes/trade-rotues');
const app = express()

mongoose.connect('mongodb+srv://aravindhfinix:aravindhfinix123@cluster0.n8ybuog.mongodb.net/trade?authSource=admin&replicaSet=atlas-xl4e7v-shard-0&readPreference=primary&appname=MongoDB%20Compass&ssl=true').then(response=>{
    console.log('mongoose connected successfully')
})

app.use(express.urlencoded({ limit: '50mb', extended: true }));

app.use('/api/v1/trade', tradeRouter)

/**
 * 404 not found exception handler
 */
app.use((req, res, next) => {
    return res.status(404).send('Requested route not found');
});

app.listen(5000, () => { console.log('sever started on port 5000') })