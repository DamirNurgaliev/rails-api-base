# JSON API - Users API

## Get User [error]

### GET /v1/users
### Request

#### Headers

<pre>Accept: application/vnd.api+json
Authorization: Bearer #[Double :jwt_token]</pre>

#### Route

<pre>GET /v1/users</pre>

#### cURL

<pre class="request">curl -g &quot;http://localhost:5000/v1/users&quot; -X GET \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer #[Double :jwt_token]&quot;</pre>

### Response

#### Headers

<pre>Content-Type: text/html</pre>

#### Status

<pre>401 Unauthorized</pre>

