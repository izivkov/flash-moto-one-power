# Flashing the ***Motorola One Power*** with official Android 10 ROM

Here are the steps to flash a complete new official rom for Moto One Power. You need [fastboot](https://androidmtk.com/download-minimal-adb-and-fastboot-tool) utility installed on your machine. This procedure works best in Linux, but you should be able to run it in Windows ny rinning the ```fastboot``` stets in the ```flashfile.sh```. 

1. Download the ROM from [here](https://mirrors.lolinet.com/firmware/moto/chef/official/RETIN/XT1942-2_CHEF_RETIN_10_QPT30.61-18_subsidy-DEFAULT_regulatory-DEFAULT_CFC.xml.zip). If your phone is different, you can get different official roms by vising [this](https://mirrors.lolinet.com/firmware/moto/chef/official) site.

2. Unzip the above file into a new directory. 

4. Put your phone in [fastboot](https://support.essential.com/hc/en-us/articles/360011974574-Reset-your-phone-from-Recovery-Mode) mode.

5. Also copy the provided ```flashfile.sh``` into the same directory, and run it:

```
chmod +x ./flashfile.sh
sudo ./flashfile.sh
```


> (This file was created using [https://github.com/dlenski/motoflash2sh](this) utility, so if for some reason the this shell does not work for you, you can recreate it using instructions on this link.

5. (Optional) Buy me a beer ;-)

<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick" />
<input type="hidden" name="hosted_button_id" value="S2NUCZRJ4EYZY" />
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate with PayPal button" />
<img alt="" border="0" src="https://www.paypal.com/en_CA/i/scr/pixel.gif" width="1" height="1" />
</form>
