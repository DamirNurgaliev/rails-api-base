# JSON API - Users API

## Update User [success]

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
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NDI4MTgzOTEsInN1YiI6NDcxfQ.JsTUtP98Kiaii-69FyzWUQnn1-K3yk8THnzJjJMHL-s
Content-Type: application/x-www-form-urlencoded</pre>

#### Route

<pre>PATCH /v1/users</pre>

#### Body

<pre>data[attributes][email]=new%40email.com&data[attributes][full_name]=Kylian+Mbappe&data[attributes][password]=12345609</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users&quot; -d &#39;data[attributes][email]=new%40email.com&amp;data[attributes][full_name]=Kylian+Mbappe&amp;data[attributes][password]=12345609&#39; -X PATCH \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NDI4MTgzOTEsInN1YiI6NDcxfQ.JsTUtP98Kiaii-69FyzWUQnn1-K3yk8THnzJjJMHL-s&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/json; charset=utf-8</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "data": {
    "id": "471",
    "type": "users",
    "attributes": {
      "email": "new@email.com",
      "full_name": "Kylian Mbappe"
    }
  }
}</pre>
