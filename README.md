# Flashing the ***Motorola One Power*** with official Android 10 ROM

**WARNING!!!: This procedure will erase all data on your phone, and you need to restore from backup.**

Here are the steps to flash a complete new official rom for [Moto One Power](https://www.digitaltrends.com/mobile/motorola-one-power-news-rumors-specs-and-more/). You need [fastboot](https://androidmtk.com/download-minimal-adb-and-fastboot-tool) utility installed on your computer. This procedure works best in Linux, but you should be able to run it in Windows by running the ```fastboot``` steps in the ```flashfile.sh```. 

1. Download the ROM from [here](https://mirrors.lolinet.com/firmware/moto/chef/official/RETIN/XT1942-2_CHEF_RETIN_10_QPT30.61-18_subsidy-DEFAULT_regulatory-DEFAULT_CFC.xml.zip). If your phone is different, you can get different official roms by vising [this](https://mirrors.lolinet.com/firmware/moto/chef/official) site.

2. Unzip the above file into a new directory. 

4. Put your phone in [fastboot](https://support.essential.com/hc/en-us/articles/360011974574-Reset-your-phone-from-Recovery-Mode) mode.

5. Also copy the provided ```flashfile.sh``` into the same directory, and run it:

```
chmod +x ./flashfile.sh
sudo ./flashfile.sh
```

Note: ***This file was created using [this](https://github.com/dlenski/motoflash2sh) utility, so if for some reason the this shell script does not work for you, you can recreate it using instructions on from the above link.***

5. After a few minutes, your phone will reboot into Android 10.
