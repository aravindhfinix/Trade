const express = require('express');
const { listData } = require('../controllers/list-trade-controller');
const { getData } = require('../controllers/trade-controller');
const { testFunction } = require('../controllers/test-function');
const tradeRouter = express.Router();

tradeRouter.get('/test',testFunction);
tradeRouter.get('/get-data', getData);
tradeRouter.get('/list-data', listData);

module.exports = tradeRouter