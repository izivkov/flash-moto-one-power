#!/bin/sh -x

cd ""

# <header>
#     <phone_model model="chef" />
#     <software_version version="chef-user 10 QPTS30.61-18-16-11 7a034 release-keysM636_31.85.01.102R" />
#     <subsidy_lock_config MD5="d41d8cd98f00b204e9800998ecf8427e" name="slcf_rev_d_default_v1.0.nvm" />
#     <regulatory_config SHA1="da39a3ee5e6b4b0d3255bfef95601890afd80709" name="regulatory_info_default.png" />
#     <sparsing enabled="true" max-sparse-size="536870912" />
#     <interfaces>
#       <interface name="AP" />
#     </interfaces>
#   </header>

md5sum --check <<EOF || exit 1
021880d9f74262fcb0a771b249df2db8 *gpt.bin
b19f3ae62640bebae50ae5648c94b49a *bootloader.img
2eb4d10cedccae623916a92ed886ffae *NON-HLOS.bin
1ccd8bae81ec82e6bd4f76bd701ee5ae *fsg.mbn
70a5fb33330c34ea375800f61a0efc1e *BTFM.bin
6e958346ad45b90549554969c9c391a1 *dspso.bin
cc282c564867624f82cecb26f6fb1fc8 *logo.bin
05bbe21541f9725c9a411c6ad88e9141 *boot.img
d90a2798aa165bf04e5f17af210176c8 *system.img_sparsechunk.0
8ecce66072b7115811d42fc8a244cf62 *system.img_sparsechunk.1
a41d35e1aff9398ed5990ba887ce38b3 *system.img_sparsechunk.2
37afd86f3b100723cd4de55ea43e82f3 *system.img_sparsechunk.3
69bc92f38837aa353a1b89ce07f6cabb *system.img_sparsechunk.4
3116c73ff2928750cdc90d3670b2bd1d *system_other.img
9ab400d045154b6d64a98ae738145d2b *vendor.img
2969aada81aaf463bbd70d0f9ea856e8 *oem.img
163ba801b0b9bb693a8ca5bd9f34f80d *oem_other.img
EOF

fastboot getvar max-sparse-size || exit 1
fastboot oem fb_mode_set || exit 1
fastboot flash partition gpt.bin || exit 1
fastboot flash bootloader bootloader.img || exit 1
fastboot flash modem NON-HLOS.bin || exit 1
fastboot flash fsg fsg.mbn || exit 1
fastboot erase modemst1 || exit 1
fastboot erase modemst2 || exit 1
fastboot flash bluetooth BTFM.bin || exit 1
fastboot flash dsp dspso.bin || exit 1
fastboot flash logo logo.bin || exit 1
fastboot flash boot boot.img || exit 1
fastboot flash system system.img_sparsechunk.0 || exit 1
fastboot flash system system.img_sparsechunk.1 || exit 1
fastboot flash system system.img_sparsechunk.2 || exit 1
fastboot flash system system.img_sparsechunk.3 || exit 1
fastboot flash system system.img_sparsechunk.4 || exit 1
fastboot flash system_b system_other.img || exit 1
fastboot flash vendor vendor.img || exit 1
fastboot flash oem oem.img || exit 1
fastboot flash oem_b oem_other.img || exit 1
fastboot erase carrier || exit 1
fastboot erase userdata || exit 1
fastboot erase ddr || exit 1
fastboot oem fb_mode_clear || exit 1
