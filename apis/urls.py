from django.urls import path
from .views import QueadraticFormula, SumGenerator, FindPrimeNumber

urlpatterns= [
    path('formula', QueadraticFormula.as_view()),
	path('sum-integer', SumGenerator.as_view()),
	path('pn', FindPrimeNumber.as_view()),
]

