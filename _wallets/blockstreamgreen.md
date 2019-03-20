---
# This file is licensed under the MIT License (MIT) available on
# http://opensource.org/licenses/MIT.

id: blockstreamgreen
title: "Blockstream Green"
titleshort: "Green"
compat: "mobile android ios"
level: 2
platform:
  - mobile:
    name: mobile
    os:
      - name: android
        text: "walletblockstreamgreen"
        link: "https://play.google.com/store/apps/details?id=com.greenaddress.greenbits_android_wallet"
        source: "https://github.com/blockstream/green_android"
        screenshot: "blockstreamgreenandroid.png"
        check:
          control: "checkpasscontrolmulti"
          validation: "checkpassvalidationspvp2p"
          transparency: "checkpasstransparencyopensource"
          environment: "checkpassenvironmenttwofactor"
          privacy: "checkpassprivacybasic"
          fees: "checkgoodfeecontrolfull"
        privacycheck:
          privacyaddressreuse: "checkpassprivacyaddressrotation"
          privacydisclosure: "checkfailprivacydisclosureaccount"
          privacynetwork: "checkpassprivacynetworksupporttorproxy"
  - mobile:
    name: mobile
    os:
      - name: ios
        text: "walletblockstreamgreen"
        link: "https://itunes.apple.com/app/id1402243590"
        source: "https://github.com/blockstream/green_ios"
        screenshot: "blockstreamgreenios.png"
        check:
          control: "checkpasscontrolmulti"
          validation: "checkpassvalidationservers"
          transparency: "checkpasstransparencyopensource"
          environment: "checkpassenvironmenttwofactor"
          privacy: "checkpassprivacybasic"
          fees: "checkgoodfeecontrolfull"
        privacycheck:
          privacyaddressreuse: "checkpassprivacyaddressrotation"
          privacydisclosure: "checkfailprivacydisclosureaccount"
          privacynetwork: "checkpassprivacynetworksupporttorproxy"
---
