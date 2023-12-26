# serializers.py
from rest_framework import serializers
from .models import Company, Doctor, Chemist, Customer

class CompanySerializer(serializers.ModelSerializer):
    class Meta:
        model = Company
        fields = '__all__'

class CompanyNameSerializer(serializers.ModelSerializer):
    class Meta:
        model = Company
        fields = ['company_name']

class DoctorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Doctor
        fields = '__all__'

class DoctorNameSerializer(serializers.ModelSerializer):
    class Meta:
        model = Doctor
        fields = ['doctor_name']

class ChemistSerializer(serializers.ModelSerializer):
    class Meta:
        model = Chemist
        fields = '__all__'

class ChemistNameSerializer(serializers.ModelSerializer):
    class Meta:
        model = Chemist
        fields = ['chemist_name']

class CustomerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Customer
        fields = '__all__'

class CustomerNameSerializer(serializers.ModelSerializer):
    class Meta:
        model = Customer
        fields = ['customer_name']
