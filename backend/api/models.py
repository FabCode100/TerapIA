from django.db import models
from django.contrib.auth.models import User

# User Table
class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)

# Conversation Table
class Conversation(models.Model):
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE) 
    timestamp = models.DateTimeField(auto_now_add=True)

# Message Table
class Message(models.Model):
    conversation = models.ForeignKey(Conversation, on_delete=models.CASCADE)
    sender = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    content = models.TextField()
    timestamp = models.DateTimeField(auto_now_add=True)
    emotion = models.CharField(max_length=255)
    advice = models.TextField()

