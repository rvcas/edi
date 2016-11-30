# API Documentation

* [EDI.V1.UserController](#ediv1usercontroller)
  * [create](#ediv1usercontrollercreate)
  * [delete](#ediv1usercontrollerdelete)
  * [update](#ediv1usercontrollerupdate)

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
    "email": "murray1909@trantow.org"
  }
}
```
##### Response
* __Status__: 201
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: tbrareajuqo25d98v544hcn24l6rbirv
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json
{
  "data": {
    "token": "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJVc2VyOjE1OTIiLCJleHAiOjE0ODA3NTE2MzgsImlhdCI6MTQ4MDQ5MjQzOCwiaXNzIjoiU2hlcGhlcmQiLCJqdGkiOiJmNWY4N2FiYS1iNGNiLTRhYjctYjU4OS1jZDNmZGIyYTgyMmMiLCJwZW0iOnt9LCJzdWIiOiJVc2VyOjE1OTIiLCJ0eXAiOiJ0b2tlbiJ9.ulXojQtEcNfg35wxHPjycYEIO7bkpNwenQL8d9o9gp8wFbBfQxuHKuhL5KdyZjknfOp5bBJvHe-R1DSrLDl5Ww",
    "id": 1592,
    "email": "murray1909@trantow.org"
  }
}
```

### EDI.V1.UserController.delete
#### DELETE /v1/users/:id with token
##### Request
* __Method:__ DELETE
* __Path:__ /v1/users/1593
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJVc2VyOjE1OTMiLCJleHAiOjE0ODA3NTE2MzgsImlhdCI6MTQ4MDQ5MjQzOCwiaXNzIjoiU2hlcGhlcmQiLCJqdGkiOiI0OWNhYzA0NS01OTY3LTQ4ZTQtOTlhNC1iMDUxMzViYjRmNjciLCJwZW0iOnt9LCJzdWIiOiJVc2VyOjE1OTMiLCJ0eXAiOiJ0b2tlbiJ9.rEd2F1QoF7QdcBqy0og_M-LC4lU6uGbEFfoYln1AgA9xlYJd65LcIwGL13ea8YMjXxboymtaWY1xINfwOatjyw
```
##### Response
* __Status__: 204
* __Response headers:__
```
cache-control: max-age=0, private, must-revalidate
x-request-id: hfl27add3okf0j4o65fhugvbdph7fhj4
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
* __Path:__ /v1/users/1594
* __Request headers:__
```
accept: application/json
authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJVc2VyOjE1OTQiLCJleHAiOjE0ODA3NTE2MzgsImlhdCI6MTQ4MDQ5MjQzOCwiaXNzIjoiU2hlcGhlcmQiLCJqdGkiOiI0OTQ3ZWJiZS0wM2NjLTRlZDUtODQwNC0yYmFmZGMwY2JlY2MiLCJwZW0iOnt9LCJzdWIiOiJVc2VyOjE1OTQiLCJ0eXAiOiJ0b2tlbiJ9.hKQ77NdsgnJMW_2c6lRNbsvt-VCPb8jxH-oHoKi2O7-xC-S2697uCro--frv55n-x4RyyAj2HFnn5YUOFwHglw
content-type: multipart/mixed; charset: utf-8
```
* __Request body:__
```json
{
  "data": {
    "email": "deja1992@fisher.biz"
  }
}
```
##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
x-request-id: 4qve584m411ngo4gmdrde0feubguk53t
access-control-allow-origin: *
access-control-expose-headers: 
access-control-allow-credentials: true
```
* __Response body:__
```json
{
  "data": {
    "id": 1594,
    "email": "deja1992@fisher.biz"
  }
}
```

