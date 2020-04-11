local access_token = require('saml.service_provider.access_token')
local config = require "saml.service_provider.config"
local cjson = require('cjson.safe')

ngx.req.read_body()
local payload = ngx.req.get_body_data()
local token = access_token.new(cjson.decode(payload))
local signed_token = token:sign(config.test.access_token)
ngx.print(signed_token)
