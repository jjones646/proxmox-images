��    "      ,  /   <      �     �       "   (  '   K  -   s     �  $   �      �       =   "  1   `  B   �     �  $   �  /        D  '   Y  #   �  )   �  !   �  ?   �     1  .   K  <   z  9   �     �  +   
     6  +   U     �     �  ?   �     �  �    *   �	     �	  (   
  8   1
  A   j
     �
  ?   �
  $     !   0  L   R  <   �  g   �  $   D  0   i  V   �     �  #     '   *  6   R  +   �  >   �  !   �  @     F   W  E   �  )   �  J        Y  E   x     �  &   �  V   �  )   U                                      
   !                   "                                 	                                                                 All upgrades installed Allowed origins are: %s Cache has broken packages, exiting Cache lock can not be acquired, exiting Download finished, but file '%s' not there?!? GetArchives() failed: '%s' Giving up on lockfile after %s delay Initial blacklisted packages: %s Installing the upgrades failed! Lock could not be acquired (another package manager running?) No packages found that can be upgraded unattended Package '%s' has conffile prompt and needs to be upgraded manually Package installation log: Packages that are auto removed: '%s' Packages with upgradable origin but kept back:
 Progress: %s %% (%s) Simulation, download but do not install Starting unattended upgrades script The URI '%s' failed to download, aborting Unattended upgrade returned: %s

 Unattended-upgrade in progress during shutdown, sleeping for 5s Unattended-upgrades log:
 Unclean dpkg state detected, trying to correct Upgrade in minimal steps (and allow interrupting with SIGINT Warning: A reboot is required to complete this upgrade.

 Writing dpkg log to '%s' You need to be root to run this application dpkg --configure -a output:
%s dpkg returned a error! See '%s' for details error message: '%s' package '%s' not upgraded package '%s' upgradable but fails to be marked for upgrade (%s) print debug messages Project-Id-Version: unattended-upgrades 0.79
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2013-09-13 08:12+0200
PO-Revision-Date: 2012-07-12 14:04+0200
Last-Translator: Omar Campagne <ocampagne@gmail.com>
Language-Team: Debian l10n Spanish <debian-l10n-spanish@lists.debian.org>
Language: es
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
X-Generator: Virtaal 0.7.1
 Se han instalado todas las actualizaciones Fuentes permitidas: %s La caché tiene paquetes rotos, saliendo No se puede establecer el bloqueo de la caché, saliendo La descarga ha finalizado, pero no se encuentra el fichero «%s» Fallo de GetArchives(): «%s» Finalizando el bloqueo del fichero después de un retraso de %s Paquetes inicialmente bloqueados: %s Fallo al instalar actualizaciones No se puede establecer el bloqueo (¿otro gestor de paquetes ejecutándose?) No se han encontrado paquetes actualizables sin supervisión El paquete «%s» solicita confirmación a través de un conffile, y se debe actualizar de forma manual Registro de instalación de paquete: Paquetes eliminados de forma automática: «%s» Paquetes con una actualización disponible en la fuente pero que no se actualizarán:
 Progreso: %s %% (%s) Simulacro, descarga pero no instala Iniciando script de unattended-upgrades Fallo al descargar desde el URI «%s», interrumpiendo Valor devuelto por unattended-upgrade: %s

 Unattended-upgrade en proceso durante el apagado, esperando 5s Registro de unattended-upgrades:
 Se ha detectado un estado no limpio de dpkg, intentando corregir Actualizar en pequeños pasos (y permitir la interrupción con SIGINT) Advertencia: Se requiere reinciar para completar la actualización.

 Escribiendo el registro de dpkg en «%s» Necesita tener privilegios de administrador para ejecutar esta aplicación dpkg --configure -a output:
%s Se ha detectado un fallo de dpkg. Para más detalles, consulte «%s» Mensaje de fallo: «%s» No se ha actualizado el paquete «%s» El paquete «%s» es actualizable, pero no se puede marcar para la actualización (%s) Mostrar mensajes de depuración de fallos 