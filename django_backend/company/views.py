from django.shortcuts import render

from rest_framework import generics
from .models import Company, Doctor, Chemist, Customer
from .serializers import CompanySerializer, DoctorSerializer, ChemistSerializer, CustomerSerializer, DoctorNameSerializer, ChemistNameSerializer, CompanyNameSerializer, CustomerNameSerializer

class CompanyListCreateView(generics.ListCreateAPIView):
    queryset = Company.objects.all()
    serializer_class = CompanySerializer

class CompanyNameListView(generics.ListAPIView):
    queryset = Company.objects.all()
    serializer_class = CompanyNameSerializer

class CompanyRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Company.objects.all()
    serializer_class = CompanySerializer

class DoctorListCreateView(generics.ListCreateAPIView):
    queryset = Doctor.objects.all()
    serializer_class = DoctorSerializer

class DoctorNameListView(generics.ListAPIView):
    queryset = Doctor.objects.all()
    serializer_class = DoctorNameSerializer

class DoctorRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Doctor.objects.all()
    serializer_class = DoctorSerializer

class ChemistListCreateView(generics.ListCreateAPIView):
    queryset = Chemist.objects.all()
    serializer_class = ChemistSerializer

class ChemistNameListView(generics.ListAPIView):
    queryset = Chemist.objects.all()
    serializer_class = ChemistNameSerializer

class ChemistRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Chemist.objects.all()
    serializer_class = ChemistSerializer

class CustomerListCreateView(generics.ListCreateAPIView):
    queryset = Customer.objects.all()
    serializer_class = CustomerSerializer

class CustomerNameListView(generics.ListAPIView):
    queryset = Customer.objects.all()
    serializer_class = CustomerNameSerializer

class CustomerRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Customer.objects.all()
    serializer_class = CustomerSerializer





