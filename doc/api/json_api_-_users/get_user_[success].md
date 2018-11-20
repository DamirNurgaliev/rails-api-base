# JSON API - Users API

## Get User [success]

### GET /v1/users
### Request

#### Headers

<pre>Accept: application/vnd.api+json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NDI4MTgzOTEsInN1YiI6NDY5fQ.In5SOvO1mMzNp-g6Upc7S0VYBnom2MLbHF1h_BMjGQg</pre>

#### Route

<pre>GET /v1/users</pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/users&quot; -X GET \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NDI4MTgzOTEsInN1YiI6NDY5fQ.In5SOvO1mMzNp-g6Upc7S0VYBnom2MLbHF1h_BMjGQg&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "469",
    "type": "users",
    "attributes": {
      "email": "robert@lewandovsky.com",
      "full_name": "Robert L."
    }
  }
}</pre>
