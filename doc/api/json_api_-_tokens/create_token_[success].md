# JSON API - Tokens API

## Create Token [success]

### POST /v1/tokens

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| email | Email | true | data[attributes] |
| password | Password | true | data[attributes] |

### Request

#### Headers

<pre>Accept: application/vnd.api+json
Content-Type: application/x-www-form-urlencoded</pre>

#### Route

<pre>POST /v1/tokens</pre>

#### Body

<pre>data[attributes][email]=testing%40mail.com&data[attributes][password]=123456</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/tokens&quot; -d &#39;data[attributes][email]=testing%40mail.com&amp;data[attributes][password]=123456&#39; -X POST \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>Content-Type: application/json; charset=utf-8</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{
  "data": {
    "id": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NDI4MTc3MjUsInN1YiI6NDM5fQ.aH1dohq39vPH57-w7QLb0GiqIADLg9WR1x852MUVjaE",
    "type": "tokens"
  }
}</pre>
