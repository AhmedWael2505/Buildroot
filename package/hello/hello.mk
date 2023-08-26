###########################################################
#
# hello module
#
###########################################################

HELLO_VERSION = 1.0

HELLO_SITE = /home/spectrum/Desktop/BuildRoot/Hello_World
HELLO_SITE_METHOD = local


$(eval $(kernel-module))
$(eval $(generic-package))