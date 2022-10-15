# bodit_test

이 프로젝트는 Python 3.10버전에서 작성되었습니다.

가상환경 설치

$ pip install -r requirements.txt

서버 구동

$ python manage.py runserver


테스틑 포스트맨(postman)으로 테스트를 진행하였으며, 

아래의 JSON을 포스트맨으로 import(Row text) 하여 테스트를 진행할 수 있습니다.

{
	"info": {
		"_postman_id": "5125611a-471b-43df-936d-4b8453bea346",
		"name": "bodit test",
		"schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json",
		"_exporter_id": "13760627"
	},
	"item": [
		{
			"name": "소수 찾기",
			"protocolProfileBehavior": {
				"disableBodyPruning": true
			},
			"request": {
				"method": "GET",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": {
					"raw": "http://127.0.0.1:8000/apis/pn?at=100",
					"protocol": "http",
					"host": [
						"127",
						"0",
						"0",
						"1"
					],
					"port": "8000",
					"path": [
						"apis",
						"pn"
					],
					"query": [
						{
							"key": "at",
							"value": "100"
						}
					]
				}
			},
			"response": []
		},
		{
			"name": "2차 방정식의 해",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "{\n\t\"a\": 1,\n\t\"b\": -4,\n\t\"c\": 3\n}",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": {
					"raw": "http://127.0.0.1:8000/apis/formula",
					"protocol": "http",
					"host": [
						"127",
						"0",
						"0",
						"1"
					],
					"port": "8000",
					"path": [
						"apis",
						"formula"
					]
				}
			},
			"response": []
		},
		{
			"name": "\b정수의 합 구하기",
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "{\n\t\"start\": 1,\n\t\"end\": 10\n}",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": {
					"raw": "http://127.0.0.1:8000/apis/sum-integer",
					"protocol": "http",
					"host": [
						"127",
						"0",
						"0",
						"1"
					],
					"port": "8000",
					"path": [
						"apis",
						"sum-integer"
					]
				}
			},
			"response": []
		}
	]
}
