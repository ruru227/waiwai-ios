# waiwai TestFlight setup

App name: waiwai
Bundle ID: com.novalink.waiwai
Version: 0.1.0
Scheme: waiwai

Codemagic requires a variable group named appstore_credentials containing these Secret values:
- APP_STORE_CONNECT_PRIVATE_KEY
- APP_STORE_CONNECT_KEY_IDENTIFIER
- APP_STORE_CONNECT_ISSUER_ID
- CERTIFICATE_PRIVATE_KEY

Create the App Store Connect app record with Bundle ID com.novalink.waiwai before publishing.

The first workflow keeps submit_to_testflight false until the signed IPA build succeeds.
