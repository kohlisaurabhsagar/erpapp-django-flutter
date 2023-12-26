from django.contrib import admin

from .models import Doctor, Company, Chemist, Customer

admin.site.register(Company)
admin.site.register(Doctor)
admin.site.register(Chemist)
admin.site.register(Customer)
# admin.site.register(UserAccounts)
