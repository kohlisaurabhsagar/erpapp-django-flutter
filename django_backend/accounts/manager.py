from django.contrib.auth.models import BaseUserManager

class UserManager(BaseUserManager):
    def create_user(self, userid, password, **extra_fields):
        if not userid :
            raise ValueError("Credentials Required!!!")
        user = self.model(userid = userid, **extra_fields)
        user.is_active = True
        user.set_password(password)
        user.save()
        
        return user

    
    def create_superuser(self, userid, password, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_active', True)

        if not extra_fields.get('is_staff'):
            raise ValueError("Superuser must have is_staff = True")

        if not extra_fields.get('is_superuser'):
            raise ValueError("Superuser must have is_superuser = True")

        return self.create_user(userid, password, **extra_fields)



