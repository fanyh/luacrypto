# LuaCrypto Library

## Introduction
LuaCrypto is a Lua wrapper for OpenSSL that offers a wide range of cryptographic functions for Lua applications.   This library enables developers to perform various cryptographic operations such as hashing, encryption, decryption, signing, and certificate management, leveraging the capabilities of the OpenSSL library.   Importantly, LuaCrypto does not require the installation of the libssl1.  x-dev package, making it easier to integrate into projects without additional dependencies.

## Features
- **Digest API**: Supports various hashing algorithms (SHA, MD5, etc.) for generating message digests.
- **Encryption and Decryption**: Provides functions for symmetric encryption and decryption using various ciphers (AES, DES, etc.).
- **HMAC**: Implements Hash-based Message Authentication Code (HMAC) for data integrity and authenticity.
- **Digital Signatures**: Allows signing and verifying data using public/private key pairs.
- **Random Number Generation**: Offers functions to generate secure random bytes.
- **Public Key Infrastructure (PKI)**: Supports operations related to public/private keys and X.509 certificates.
- **Base64 Encoding/Decoding**: Facilitates encoding and decoding of data in Base64 format.
- **Hex Encoding**: Provides functions to convert binary data to hexadecimal representation.

## Installation
To use LuaCrypto, ensure that you have OpenSSL installed on your system. You can then compile and link the LuaCrypto library with your Lua application.

## Env
Replace /usr/include/lua with the actual path where you install Lua.
```
BUILD_DIR=/usr/include/lua
```

## Build
```
    make
```

## Usage

### Digest API
```lua
local crypto = require("crypto")

-- Create a new digest
local digest = crypto.digest.new("sha256")

-- Update the digest with data
digest:update("Hello, World!")

-- Finalize the digest and get the result
local result = digest:final()
print(result)  -- Outputs the SHA-256 hash|

-- ... and so on
```