from  rest_framework import serializers
from .models import CustomUser
from django.contrib.auth import authenticate

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ('id','userid', 'first_name', 'last_name', 'phone_number', 'company')
        

class CreateUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = '__all__'
        extra_kwargs = {
            'password': {'required': True}
        }
    
    def validate(self, attrs):
        userid = attrs.get('userid', '').strip().lower()
        if CustomUser.objects.filter(userid=userid).exists():
            raise serializers.ValidationError("User with this userid already exist!!!")
        return attrs
    
    def create(self, validated_data):
        user = CustomUser.objects.create_user(**validated_data)
        return user
    

class UpdateUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ('first_name', 'last_name', 'userid', 'phone_number', 'password')
    
    def update(self, instance, validated_data):
        password = validated_data.pop('password')
        if password:
            instance.set_password(password)
        instance = super().update(instance, validated_data)
        return instance
    
class LoginSerializer(serializers.Serializer):
    userid = serializers.CharField()
    password = serializers.CharField(style={'input_type': "password"}, trim_whitespace=False)

    def validate(self, attrs):
        userid = attrs.get('userid').lower()
        password = attrs.get('password')

        if not userid or not password:
            raise serializers.ValidationError("Please give both userid and password")
        
        if not CustomUser.objects.filter(userid = userid).exists():
            raise serializers.ValidationError('User does not exist.')
            
        user = authenticate(request=self.context.get('request'), userid = userid, password=password)

        if not user:
            raise serializers.ValidationError("Wrong Credentials!!!")
        
        attrs['user'] = user
        return attrs
    
