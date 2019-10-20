# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models

from django.contrib.auth.models import User

# Create your models here.

tipos_documentos = (('CC-Cédula de ciudadanía', 'CC-Cédula de ciudadanía'), ('CE-Cédula de Extranjería', 'CE-Cédula de Extranjería'), ('TI-Tarjeta de identidad', 'TI-Tarjeta de identidad'), ('PA-Pasaporte', 'PA-Pasaporte'))

roles = (('Estudiante', 'Estudiante'), ('Profesor', 'Profesor'), ('Secretaría', 'Secretaría'))

class Persona (User):
	rol = models.CharField (max_length = 20, verbose_name = 'Rol', choices = roles)
	tipo_documento = models.CharField (max_length = 50, verbose_name='Tipo de documento', choices=tipos_documentos)
	numero_documento = models.IntegerField ()

	def __str__(self):
		return '%s %s' %(self.first_name, self.last_name)

	class Meta:
		unique_together = ['tipo_documento', 'numero_documento']