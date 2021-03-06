from django.urls import path
from rest_framework.authtoken.views import obtain_auth_token

from . import views
app_name = 'api'
urlpatterns = [
    path('api-token-auth/', obtain_auth_token, name='api_token_auth'),
]
