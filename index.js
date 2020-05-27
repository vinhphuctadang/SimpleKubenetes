const express = require('express')
// const parser = require('body-parser')
const app = express()
const PORT = process.env.PORT || 8000

//app.use(parser)

app.get('/', async(req, res)=>{
	let result = {
		ok : 1,
	}
	res.send(result)
})

app.get('/author', async(req, res)=>{
	let result = {
		ok : 1,
		author: 'Vinh Phuc Ta Dang',
	}
	res.send(result)
})

app.listen(PORT, async =>{
	console.log('Listening on port', PORT)
})
