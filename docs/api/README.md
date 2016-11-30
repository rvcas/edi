# API Documentation

* [EDI.AuthController](#ediauthcontroller)
  * [create](#ediauthcontrollercreate)
  * [show](#ediauthcontrollershow)
* [EDI.V1.UserController](#ediv1usercontroller)
  * [create](#ediv1usercontrollercreate)
  * [delete](#ediv1usercontrollerdelete)
  * [update](#ediv1usercontrollerupdate)

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

## EDI.V1.UserController
### EDI.V1.UserController.create
#### POST /v1/users valid data
##### Request
* __Method:__ POST
* __Path:__ /v1/users
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
    "email": "winfield_johnson@armstrong.info"
  }
}
```
##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: vaiatnuk8ih68588fjccvelqq2dr5lqb
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json
{
  "data": {
    "token": "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJVc2VyOjE2MTAiLCJleHAiOjE0ODA3NTE4NDQsImlhdCI6MTQ4MDQ5MjY0NCwiaXNzIjoiU2hlcGhlcmQiLCJqdGkiOiI4YTdkODEzYS03M2U1LTQyMzctOTk4Yy0wY2JmM2ExNjZkNDUiLCJwZW0iOnt9LCJzdWIiOiJVc2VyOjE2MTAiLCJ0eXAiOiJ0b2tlbiJ9.zFC2g9Kmt8_aD__8G5_y5S2eNBz83oTBdUU_9IJKBjv8tPZoIB53R0yv4OXMkQrCY7yNmo3Dohbx2UExbxkKUw",
    "id": 1610,
    "email": "winfield_johnson@armstrong.info"
  }
}
```

### EDI.V1.UserController.delete
#### DELETE /v1/users/:id with token
##### Request
* __Method:__ DELETE
* __Path:__ /v1/users/1604
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJVc2VyOjE2MDQiLCJleHAiOjE0ODA3NTE4NDIsImlhdCI6MTQ4MDQ5MjY0MiwiaXNzIjoiU2hlcGhlcmQiLCJqdGkiOiJjN2Y2OGQ0OC04ODIwLTRjM2EtOTI5Mi00OWM2ZjkxN2ExNjMiLCJwZW0iOnt9LCJzdWIiOiJVc2VyOjE2MDQiLCJ0eXAiOiJ0b2tlbiJ9.6DeVVro4_NuhLM5_u3yKgNxj2CnYw8Pfygn02sUUB2joh1jxxQxqiB7qw6i-1B-YiO2YHLhueuLjt3cMFDj53w
```
##### Response
* __Status__: 204
* __Response headers:__
```
cache-control: max-age=0, private, must-revalidate
x-request-id: jvocm6joekrpnlb3si3is4s1diu62l2e
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json

```

### EDI.V1.UserController.update
#### PUT /v1/users/:id valid data and token
##### Request
* __Method:__ PUT
* __Path:__ /v1/users/1607
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJVc2VyOjE2MDciLCJleHAiOjE0ODA3NTE4NDMsImlhdCI6MTQ4MDQ5MjY0MywiaXNzIjoiU2hlcGhlcmQiLCJqdGkiOiJhNjczMTMxZi00MzBlLTRhYmItYmJkOC1lYzYxMGI1NDFhMjUiLCJwZW0iOnt9LCJzdWIiOiJVc2VyOjE2MDciLCJ0eXAiOiJ0b2tlbiJ9.fYTGVoLPPQvsUWPj6rVfjFU-K5a5E8T69zknJF3c6OrHmum1WQn-Qfpv4bn-KXyUv2fOeha-8nHyFRer2sPH3Q
content-type: multipart/mixed; charset: utf-8
```
* __Request body:__
```json
{
  "data": {
    "email": "alysha2018@willms.org"
  }
}
```
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: irg2v6fslnlpovipfreutbo7k735papa
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json
{
  "data": {
    "id": 1607,
    "email": "alysha2018@willms.org"
  }
}
```

