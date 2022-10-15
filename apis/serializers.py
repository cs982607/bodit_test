from rest_framework import serializers

class QueadraticFormulaSerializer(serializers.Serializer):
    a = serializers.IntegerField(required=True)
    b = serializers.IntegerField(required=True)
    c = serializers.IntegerField(required=True)


class SumGeneratorSerializer(serializers.Serializer):
    start = serializers.IntegerField(required=True)
    end = serializers.IntegerField(required=True)