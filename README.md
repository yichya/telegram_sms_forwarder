# telegram_sms_forwarder

Forward incoming SMS messages to a Telegram Bot. Pure Lua implementation for OpenWrt 3G / 4G routers.

## Requirements

* OpenWrt
* uqmi supported 3G / 4G adapter set to use "SM" as default SMS storage
    * Quectel EC20 for example
    * [Use AT+CPMS command to set default SMS storage](https://www.developershome.com/sms/cpmsCommand.asp)
* a telegram bot

