from rest_framework.views import APIView
from django.http.response import JsonResponse
from django.http.request import HttpRequest
import json

from apis.serializers import QueadraticFormulaSerializer, SumGeneratorSerializer


class quadratic_error(Exception):
    pass

class QueadraticFormula(APIView):
	def post(self, request: HttpRequest):
		data: QueadraticFormulaSerializer = QueadraticFormulaSerializer(request.data).data
		try:
			a: int = data.get("a")
			b: int = data.get("b")
			c: int = data.get("c")

			if a == 0: 
				raise quadratic_error

			D = (b**2) - (4*a*c)
			if D>0:
				result: list = []
				x1=result.append(round((-b-D**0.5)/2*a))
				x2=result.append(round((-b+D**0.5)/2*a))
				result.sort
				return JsonResponse({
					"statusCode": 200,
					"x" : result
				})
			elif D==0:
				x = -b / 2*a
				return JsonResponse({
					"statusCode": 200,
					"x" : [round(x)]
				})
			else:
				raise ValueError
		except ValueError:
			return JsonResponse({
				"statusCode": 400,
				"x" : "ValueError"
			})
		except quadratic_error:
			return JsonResponse({
				"statusCode": 400,
				"x" : "error"
			})


class SumGenerator(APIView):
	def post(self, request: HttpRequest):
		data: SumGeneratorSerializer = SumGeneratorSerializer(request.data).data
		try:
			start: int = data.get("start")
			end: int = data.get("end")
			if start > end:
				raise ValueError

			result:int = sum(n for n in range(start, end+1))  
			return JsonResponse({
						"statusCode": 200,
						"result": result
					})
		except ValueError:
			return JsonResponse({
				"statusCode": 400,
				"message" : "ValueError"
			})


class FindPrimeNumber(APIView):
	def get(self, request: HttpRequest):
		number: int = int(request.GET.get('at', None))
		try:
			if number is None or number in (0,1):
				raise ValueError
			
			sieve: list = [False, False] + [True] * (number + 1)
			primes: list = []
			for i in range(2, number+1):
				if sieve[i]==True:
					primes.append(i)
					for j in range(i * 2, number + 1, i):
						sieve[j] = False
			return JsonResponse({
						"statusCode": 200,
						"count": len(primes),
						"pn": primes
					})
		except ValueError:
			return JsonResponse({
				"statusCode": 400,
				"message" : "ValueError"
			})
