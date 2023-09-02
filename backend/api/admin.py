from django.contrib import admin
from .models import UserProfile, Conversation, Message

admin.site.register(UserProfile)
admin.site.register(Conversation)
admin.site.register(Message)