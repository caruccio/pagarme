#!/usr/bin/env python

from bottle import get, post, request, run, template
import requests
import json
import os

API_KEY = os.environ.get('API_KEY')

@get('/')
def index():
	assert API_KEY, 'Edite o arquivo e insira sua API_KEY'
	return template('pagarme')

@post('/new')
def index():
	assert API_KEY, 'Edite o arquivo e insira sua API_KEY'
	card_data = {
		'api_key':   API_KEY,
		'card_hash': request.forms['card_hash'],
	}
	print 'CARD DATA: ', card_data
	response = requests.post('https://api.pagar.me/1/cards', data=card_data)
	return response.json()

@get('/pay')
def pay():
	assert API_KEY, 'Edite o arquivo e insira sua API_KEY'
	trans_data = {
		'api_key': API_KEY,
		'amount': 1000,
		'card_id': request.query['card_id'],
		#'postback_url': 'http://requestb.in/1999u831',
	}
	print 'TRANSACTION DATA: ', trans_data
	response = requests.post('https://api.pagar.me/1/transactions', data=trans_data)
	return response.json()

run(host='localhost', port=8000, debug=True, reloader=True)
