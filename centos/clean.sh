#!/bin/bash
set -e

source common/ui.sh
source common/utils.sh

debug 'Bringing container up'
utils.lxc.start

info "Cleaning up '${CONTAINER}'..."

log 'Removing temporary files...'
rm -rf ${ROOTFS}/tmp/*

log 'cleaning up dhcp leases'
rm -f ${ROOTFS}/var/lib/dhcp/*

sed -i -e '/DHCP_HOSTNAME/d' ${ROOTFS}/etc/sysconfig/network-scripts/ifcfg-*
