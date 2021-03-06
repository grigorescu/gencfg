#!/bin/bash
#
# See LICENSE for copyright information
#

beacon()
{
for n in $(seq 1 $NUM)
do

if [[ $SSID == random ]]; then
set -- "$1" "$2" "$(tr -dc "[:alpha:]" < /dev/urandom | head -c 8)"
fi

cat <<EOF
{

 /* Header Revision */
 0x00,

 /* Header Pad */
 0x00,

 /* Header Length */
 0x1a, 0x00,

 /* Present Flags */
 0x2f, 0x48, 0x00, 0x00,

 /* MAC Timestamp */
 0x20, 0x56, 0x92, 0x4c,
 0x00, 0x00, 0x00, 0x00,

 /* Flags (FCS Set)*/
 0x10,

 /* Data Rate */
 0x02,

 /* Channel Frequency */
 0x6c, 0x09,

 /* Channelt Type */
 0xa0, 0x00,

 /* SSI Signal */
 0xb8,

 /* Antenna */
 0x01,

 /* RX Flags */
 0x00, 0x00,

 /* Beacon */
 0x80, 0x00,

 /* Duration */
 0x00, 0x00,

 /* Dest MAC Address */
 ${1:-0xff,0xff,0xff,0xff,0xff,0xff,}

 /* Source Address */
 ${2:-0xaa, 0xbb, 0xcc, 0x11, 0x22, 0x33,}

 /* BSS ID */
 0x00, 0x27, 0x0d, 0x48, 0x7a, 0xb0,

 /* Fragment number & Sequence Number */
 0x20, 0x5b,

        /* 802.11 Management Frame */

 /* Timestamp */
 0x24, 0x80, 0xb4, 0x14, 0x15, 0x08, 0x00, 0x00,

 /* Beacon Interval */
 0x66, 0x00,

 /* Capabilities Information */
 0x31, 0x04, 0x00, 0x08,

 /* SSID */
 "${3:-trafgen!}",

 /* Supported Rates */
 0x01, 0x06, 0x98, 0x24, 0x30, 0x48, 0x60, 0x6c,

 /* DS Parameter Set */
 0x03, 0x01, 0x01,

 /* Traffic Indication Map */
 0x05, 0x04, 0x00, 0x01, 0x00, 0x00,

 /* County Information */
 0x07, 0x06, 0x55, 0x53, 0x20, 0x01, 0x0b, 0x1e,

 /* QBSS Load Element */
 0x0b, 0x05, 0x00, 0x00, 0x07, 0x8d, 0x5b,

 /* ERP Information */
 0x2a, 0x01, 0x00,

 /* HT Capabilites */
 0x2d, 0x1a, 0x2c, 0x18, 0x1b, 0xff, 0xff, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00,

 /* RSN Information */
 0x30, 0x14, 0x01, 0x00, 0x00, 0x0f, 0xac, 0x04, 0x01,
 0x00, 0x00, 0x0f, 0xac, 0x04, 0x01, 0x00, 0x00, 0x0f,
 0xac, 0x01, 0x28, 0x00,

 /* HT Information */
 0x3d, 0x16, 0x01, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,

 /* Vendor Tag */

        /* (Vendor Tag) Cisco*/
        0x96,

        /* Tag Length */
        0x06,

        /* Tag Interpretation */
        0x00, 0x40, 0x96, 0x00, 0x0e, 0x00,

 /*  Vendor Specific */
 0xdd, 0x18, 0x00, 0x50, 0xf2, 0x02, 0x01, 0x01, 0x80,
 0x00, 0x03, 0xa4, 0x00, 0x00, 0x27, 0xa4, 0x00, 0x00,
 0x42, 0x43, 0x5e, 0x00, 0x62, 0x32, 0x2f, 0x00,
 0xdd, 0x06, 0x00, 0x40, 0x96, 0x01, 0x01, 0x04,
 0xdd, 0x05, 0x00, 0x40, 0x96, 0x03, 0x05, 0xdd, 0x05,
 0x00, 0x40, 0x96, 0x0b, 0x09, 0xdd, 0x08, 0x00,
 0x40, 0x96, 0x13, 0x01, 0x00, 0x34, 0x01, 0xdd, 0x05,
 0x00, 0x40, 0x96, 0x14, 0x05, 0xdd, 0x1d, 0x00, 0x40,
 0x96, 0x0c, 0x03, 0x28, 0x46, 0xd5, 0x37, 0x66, 0xa7,
 0x3c, 0x01, 0x00, 0x00, 0x36, 0x78, 0x15, 0x00, 0x00,
 0x00, 0x4c, 0xd6, 0x7f, 0x39, 0x8f, 0x31, 0xdc, 0xaf,

 /* Frame check sequence */
 0xf3, 0x93, 0xc8, 0xd3,

}
EOF
done
}

