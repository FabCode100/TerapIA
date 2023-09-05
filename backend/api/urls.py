from django.urls import path
from .views import UserListView, MessageListView, ConversationListView

urlpatterns = [
    path('api/users/', UserListView.as_view(), name='user-list'),  
    path('api/messages/', MessageListView.as_view(), name='message-list'),  
    path('api/conversations/', ConversationListView.as_view(), name='conversation-list'),  
]
