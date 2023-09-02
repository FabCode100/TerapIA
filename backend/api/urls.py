from django.urls import path
from . import views

urlpatterns = [
    path('users/', views.UserListView.as_view(), name='user-list'),
    path('users/<int:pk>/', views.UserDetailView.as_view(), name='user-detail'),

    path('conversations/', views.ConversationListView.as_view(), name='conversation-list'),
    path('conversations/<int:pk>/', views.ConversationDetailView.as_view(), name='conversation-detail'),

    path('messages/', views.MessageListView.as_view(), name='message-list'),
    path('messages/<int:pk>/', views.MessageDetailView.as_view(), name='message-detail'),
]
