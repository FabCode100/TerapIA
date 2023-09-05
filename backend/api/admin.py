from django.contrib import admin
from .models import UserProfile, Conversation, Message

admin.site.register(UserProfile)
admin.site.register(Conversation)
admin.site.register(Message)

class UserAdmin(admin.ModelAdmin):
    list_display = ['id', 'username', 'email']
    
class ConversationAdmin(admin.ModelAdmin):
    list_display = ['conversationid', 'userid', 'timestamp']

class MessageAdmin(admin.ModelAdmin):
    list_display = ['messageid', 'conversationid', 'senderid', 'content', 'timestamp', 'emotion', "advice"]