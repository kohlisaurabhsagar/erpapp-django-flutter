from django.db import models
from django.contrib.auth.models import AbstractBaseUser
from .manager import UserManager
from company.models import Company


class CustomUser(AbstractBaseUser):
    userid = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=128,null=True)
    first_name = models.CharField(max_length=255, null=True, blank=True)
    last_name = models.CharField(max_length=255, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    phone_number = models.CharField(max_length=20, blank=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    company = models.ForeignKey(Company, on_delete=models.CASCADE, default=1)


    USERNAME_FIELD = 'userid'
    REQUIRED_FIELDS = []

    objects = UserManager()

    def __str__(self):
        return self.userid

    def has_module_perms(self, app_label):
        return True

    def has_perm(self, perm, obj=None):
        return True
    

