from django.db import models
class Participant(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=60)
    comment = models.TextField(default='')
class Table(models.Model):
    id=models.AutoField(primary_key=True)
    participant = models.ForeignKey(Participant)
    symbol = models.CharField(max_length=2)
    time =  models.DateTimeField(auto_now_add=True)
    comment = models.TextField(default='')
    red = models.SmallIntegerField()
    green = models.SmallIntegerField()
    blue = models.SmallIntegerField()



