# API Documentation

* [EDI.AuthController](#ediauthcontroller)
  * [create](#ediauthcontrollercreate)
  * [show](#ediauthcontrollershow)
* [EDI.V1.UserController](https://github.com/lrosa007/edi/tree/master/docs/api/v1#ediv1usercontroller)
  * [create](https://github.com/lrosa007/edi/tree/master/docs/api/v1#ediv1usercontrollercreate)
  * [delete](https://github.com/lrosa007/edi/tree/master/docs/api/v1#ediv1usercontrollerdelete)
  * [update](https://github.com/lrosa007/edi/tree/master/docs/api/v1#ediv1usercontrollerupdate)

## EDI.AuthController
### EDI.AuthController.create
#### POST /auth/login successful authentication
##### Request
* __Method:__ POST
* __Path:__ /auth/login
* __Request headers:__
```
accept: application/json
content-type: multipart/mixed; charset: utf-8
```
* __Request body:__
```json
{
  "data": {
    "password": "secret",
    "email": "email-10@example.com"
  }
}
```
##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: mome858bc8k5qro032q3thqjcoqejn8e
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json
{
  "data": {
    "token": "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJVc2VyOjE2MTUiLCJleHAiOjE0ODA3NTE4NDUsImlhdCI6MTQ4MDQ5MjY0NSwiaXNzIjoiU2hlcGhlcmQiLCJqdGkiOiJjNTczNGI5Mi03ZGY4LTRjYzMtODYyZC1iZTE1YTRhYjJjNzQiLCJwZW0iOnt9LCJzdWIiOiJVc2VyOjE2MTUiLCJ0eXAiOiJ0b2tlbiJ9.cz7gavm3hm-wGbceCwsqHnR268b6BAVwF3rht-aTlRRlotnnuDz98yGqJhN-q81EEamRBzQfBKOnE-v2gfG2rQ",
    "id": 1615,
    "email": "email-10@example.com"
  }
}
```

### EDI.AuthController.show
#### GET /auth/me authenticated user gets their info
##### Request
* __Method:__ GET
* __Path:__ /auth/me
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJVc2VyOjE2MTIiLCJleHAiOjE0ODA3NTE4NDQsImlhdCI6MTQ4MDQ5MjY0NCwiaXNzIjoiU2hlcGhlcmQiLCJqdGkiOiI2MGQ2ZGVjMy03NmE5LTQ1NWQtOTgwNy0yODU3MmVkMjA1NGEiLCJwZW0iOnt9LCJzdWIiOiJVc2VyOjE2MTIiLCJ0eXAiOiJ0b2tlbiJ9.7-AzDSFqR7ASRN-7Bpna7UYLirDH45CB33W_Lj9wsx1f1f-HIagTX0kbXr7U3JAb_fxejK63E5G31LrZVXY7YQ
```
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 0k3mlgp90flej1tjuj9ab52n51b76chh
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json
{
  "data": {
    "id": 1612,
    "email": "email-7@example.com"
  }
}
```
