from django.db import models

class Company(models.Model):
    company_id = models.AutoField(primary_key=True)
    company_name = models.CharField(max_length=50)
    company_address = models.CharField(max_length=50)

    def __str__(self):
        return self.company_name
    
class Doctor(models.Model):
    doctor_id = models.AutoField(primary_key=True)
    doctor_name = models.CharField(max_length=50, null=False)
    doctor_age = models.IntegerField()
    company = models.ForeignKey(Company, on_delete=models.CASCADE)

    def __str__(self):
        return self.doctor_name

class Chemist(models.Model):
    chemist_id = models.AutoField(primary_key=True)
    chemist_name = models.CharField(max_length=50,null=False)
    chemist_age = models.IntegerField()
    company = models.ForeignKey(Company, on_delete=models.CASCADE)

    def __str__(self):
        return self.chemist_name

class Customer(models.Model):
    customer_id = models.AutoField(primary_key=True)
    customer_name = models.CharField(max_length=50,null=False)
    customer_age = models.IntegerField()
    company = models.ForeignKey(Company, on_delete=models.CASCADE)

    def __str__(self):
        return self.customer_name








    