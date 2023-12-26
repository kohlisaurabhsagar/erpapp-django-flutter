from django.urls import path
from .views import CompanyListCreateView, CompanyRetrieveUpdateDestroyView, DoctorListCreateView, DoctorRetrieveUpdateDestroyView, ChemistListCreateView, ChemistRetrieveUpdateDestroyView, CustomerListCreateView, CustomerRetrieveUpdateDestroyView, DoctorNameListView, CompanyNameListView, ChemistNameListView, CustomerNameListView

urlpatterns = [
    path('companies/', CompanyListCreateView.as_view(), name='company-list-create'),
    path('companies/names/', CompanyNameListView.as_view(), name='company-names-list'),
    path('companies/<int:pk>/', CompanyRetrieveUpdateDestroyView.as_view(), name='company-retrieve-update-destroy'),
    path('doctors/', DoctorListCreateView.as_view(), name='doctor-list-create'),
    path('doctors/names/', DoctorNameListView.as_view(), name='doctor-names-list'),
    path('doctors/<int:pk>/', DoctorRetrieveUpdateDestroyView.as_view(), name='doctor-retrieve-update-destroy'),
    path('chemists/', ChemistListCreateView.as_view(), name='chemist-list-create'),
    path('chemists/names/', ChemistNameListView.as_view(), name='chemist-names-list'),
    path('chemists/<int:pk>/', ChemistRetrieveUpdateDestroyView.as_view(), name='chemist-retrieve-update-destroy'),
    path('customers/', CustomerListCreateView.as_view(), name='customer-list-create'),
    path('customers/names/', CustomerNameListView.as_view(), name='customer-names-list'),
    path('customers/<int:pk>/', CustomerRetrieveUpdateDestroyView.as_view(), name='customer-retrieve-update-destroy'),
    
    
]

