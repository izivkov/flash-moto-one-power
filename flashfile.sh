#!/bin/sh -x

cd ""

# <header>
#     <phone_model model="chef" />
#     <software_version version="chef-user 10 QPT30.61-18 18a03 release-keysM636_29.59.01.100R" />
#     <subsidy_lock_config MD5="d41d8cd98f00b204e9800998ecf8427e" name="slcf_rev_d_default_v1.0.nvm" />
#     <regulatory_config SHA1="da39a3ee5e6b4b0d3255bfef95601890afd80709" name="regulatory_info_default.png" />
#     <sparsing enabled="true" max-sparse-size="536870912" />
#     <interfaces>
#       <interface name="AP" />
#     </interfaces>
#   </header>

md5sum --check <<EOF || exit 1
c765be53f583ad85b26dca4d34ae4c31 *gpt.bin
87fb661b841401b74ca4f9cd3d713638 *bootloader.img
7f50f19c5f6941fdae46e3016ef8eabe *NON-HLOS.bin
7f9eb702d878925e21b0ea572d638535 *fsg.mbn
8671ce8fbf0e5cb45b99223c8d12be74 *BTFM.bin
6e958346ad45b90549554969c9c391a1 *dspso.bin
b3371f18d62a46660a02d228568431ac *logo.bin
3b2186261706956e09bcf9d777c57194 *boot.img
feb03ff50a4345ea7bf298e525f5e647 *system.img_sparsechunk.0
5e49f2e0a59247471e02a5808be85757 *system.img_sparsechunk.1
428fb14043e8172fc24a71462430e121 *system.img_sparsechunk.2
596819c5ffc5dbadf0df6e0ffd841355 *system.img_sparsechunk.3
1e13616102407005b10216a866bf654b *system.img_sparsechunk.4
8afb4b900b4c1cd1f2bf3004f160bebc *system_other.img
af9cb1340c254fff750ad3e08ed0bb28 *vendor.img
6814f0e5483c47cea95e8f8459c7698b *oem.img
02ea0362aece84c33a68693e06b16417 *oem_other.img
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
