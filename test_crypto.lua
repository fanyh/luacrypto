local Crypto  = require "crypto"

local hex = Crypto.hex
local rand = Crypto.rand
local digest = Crypto.digest
local base64 = Crypto.base64
local unbase64 = Crypto.unbase64

local config = {
    sig_len = 32,
    alg_name = "aes-128-ecb",
    iv = "",
}

local function gen_secret_salt(password)
    local d = digest.new("md5")
    d:update(password)
    local hash = d:final()
    return hash:sub(1,16), hash:sub(17)
end

local function unhex(hexstr)
    local t = {}
    for i=1,#hexstr,2 do
        local value = tonumber(hexstr:sub(i, i+1), 16)
        t[#t+1] = string.char(value)
    end
    return table.concat(t)
end

local function md5_signature(...)
    local d = digest.new("md5")
    for _, v in ipairs({...}) do
        d:update(v)
    end
    return d:final()
end

function gen_token(content, password)
    -- 生成密钥和盐
    local secret, salt = gen_secret_salt(password)

    local cipher,err = Crypto.encrypt(config.alg_name, content, secret, config.iv)
    local content = hex(cipher)
    local signature = md5_signature(content, salt)
    return signature
end

local function test()
    local a = {
        a1 = 1,
        a2 = "a",
    }

    local token = gen_secret_salt("test")
    print("token:", token)
    local sign = md5_signature("a", b)
    print("sign:", sign)
    local aes = gen_token("123", "test")
    print("aes", aes)
end
test()
