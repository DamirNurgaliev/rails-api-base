# JSON API - Tokens API

## Create Token [error]

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

<pre>data[attributes][email]=testing%40mail.com&data[attributes][password]=wrong_password</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/tokens&quot; -d &#39;data[attributes][email]=testing%40mail.com&amp;data[attributes][password]=wrong_password&#39; -X POST \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>Content-Type: text/html</pre>

#### Status

<pre>404 Not Found</pre>

