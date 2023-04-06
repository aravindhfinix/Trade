const { Trade } = require('../models/trade-model')


exports.listData = (req, res) => {
    const query = req.query
    const options = {
        page: query.page || 0,
        limit: (query.limit != undefined && query.limit !== '0') ? query.limit : 10,
        sort: { created_at: 1 },
    }
    Trade.paginate(query, options)
        .then(response => {
            res.send(response)
        })
        .catch(err => {
            res.send(err.message)
        })
}
