from django.urls import path
from .views import QueadraticFormula, SumGenerator, FindPrimeNumber, PapagoTranslation

urlpatterns= [
    path('formula', QueadraticFormula.as_view()),
	path('sum-integer', SumGenerator.as_view()),
	path('pn', FindPrimeNumber.as_view()),
	path('papago', PapagoTranslation.as_view()),
]

