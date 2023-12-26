# from django.db import models
# from accounts.models import CustomUser
# from company.models import Company

    
# class doctorsummary(models.Model):
#     class Meta:
#         unique_together = (('company','user'),)
#     company = models.ForeignKey(Company, on_delete=models.CASCADE)
#     user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)


# class chemistsummary(models.Model):
#     class Meta:
#         unique_together = (('company','user'),)
#     company = models.ForeignKey(Company, on_delete=models.CASCADE)
#     user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)

# class customersummary(models.Model):
#     class Meta:
#         unique_together = (('company','user'),)
#     company = models.ForeignKey(Company, on_delete=models.CASCADE)
#     user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)