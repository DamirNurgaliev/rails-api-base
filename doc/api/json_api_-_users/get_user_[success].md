# JSON API - Users API

## Get User [success]

### GET /v1/users
### Request

#### Headers

<pre>Accept: application/vnd.api+json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NDI4MTc3MjUsInN1YiI6NDQxfQ.ETZJI9toOsSTqXso1AjyIGwYv3yEfyOTk6uG13SUC5g</pre>

#### Route

<pre>GET /v1/users</pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/users&quot; -X GET \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NDI4MTc3MjUsInN1YiI6NDQxfQ.ETZJI9toOsSTqXso1AjyIGwYv3yEfyOTk6uG13SUC5g&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "441",
    "type": "users",
    "attributes": {
      "email": "robert@lewandovsky.com",
      "full_name": "Robert L."
    }
  }
}</pre>
