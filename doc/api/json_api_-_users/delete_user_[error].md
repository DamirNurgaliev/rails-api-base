# JSON API - Users API

## Delete User [error]

### DELETE /v1/users
### Request

#### Headers

<pre>Accept: application/vnd.api+json
Authorization: Bearer #[Double :jwt_token]
Content-Type: application/x-www-form-urlencoded</pre>

#### Route

<pre>DELETE /v1/users</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Accept: application/vnd.api+json&quot; \
	-H &quot;Authorization: Bearer #[Double :jwt_token]&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>Content-Type: text/html</pre>

#### Status

<pre>401 Unauthorized</pre>

