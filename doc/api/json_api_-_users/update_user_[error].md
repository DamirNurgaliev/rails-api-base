# JSON API - Users API

## Update User [error]

### PATCH /v1/users

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| email | Email | false | data[attributes] |
| full_name | Full Name | false | data[attributes] |
| password | Password | false | data[attributes] |

### Request

#### Headers

<pre>Accept: application/vnd.api+json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NDI4MTc3MjUsInN1YiI6NDQ0fQ.olnVFKXE1n3pKuPzpzDOJA7-E_Y1k6FvZaQM9sFm4wQ
Content-Type: application/x-www-form-urlencoded</pre>

#### Route

<pre>PATCH /v1/users</pre>

#### Body

<pre>data[attributes][email]=new%40email.com&data[attributes][full_name]=Kylian+Mbappe&data[attributes][password]=12345</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users&quot; -d &#39;data[attributes][email]=new%40email.com&amp;data[attributes][full_name]=Kylian+Mbappe&amp;data[attributes][password]=12345&#39; -X PATCH \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NDI4MTc3MjUsInN1YiI6NDQ0fQ.olnVFKXE1n3pKuPzpzDOJA7-E_Y1k6FvZaQM9sFm4wQ&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/json; charset=utf-8</pre>

#### Status

<pre>422 Unprocessable Entity</pre>

#### Body

<pre>{
  "errors": [
    {
      "source": {
        "pointer": "/data/attributes/password"
      },
      "detail": "is too short (minimum is 6 characters)"
    }
  ]
}</pre>
