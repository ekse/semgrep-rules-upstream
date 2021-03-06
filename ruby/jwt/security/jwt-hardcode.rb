require 'jwt'

# ruleid: ruby-jwt-hardcoded-secret
secret = 'secret-yo'

def bad1
    # ruleid: ruby-jwt-hardcoded-secret
    hmac_secret = 'my$ecretK3y'
    token = JWT.encode payload, hmac_secret, 'HS256'
    puts token
end

def bad2(token)
    decoded_token = JWT.decode token, secret, true, { algorithm: 'HS256' }
    puts decoded_token
end

def bad3
    # ruleid: ruby-jwt-hardcoded-secret
    token = JWT.encode payload, 'hardcode', 'HS256'
    puts token
end

def bad4
    # ruleid: ruby-jwt-hardcoded-secret
    token = JWT.encode payload, nil, 'HS256'
    puts token
end

def ok1(secret_key)
    # ok: ruby-jwt-hardcoded-secret
    token = JWT.encode payload, hmac_secret, 'HS256'
    puts token
    decoded_token = JWT.decode token, secret_key, true, { algorithm: 'HS256' }
    puts decoded_token
end
