# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Participant',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('name', models.CharField(max_length=60)),
                ('comment', models.TextField(default=b'')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Table',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('symbol', models.CharField(max_length=2)),
                ('time', models.DateTimeField(auto_now_add=True)),
                ('comment', models.TextField()),
                ('red', models.SmallIntegerField()),
                ('green', models.SmallIntegerField()),
                ('blue', models.SmallIntegerField()),
                ('participant', models.ForeignKey(to='main.Participant')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
