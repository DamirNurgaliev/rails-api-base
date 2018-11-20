# JSON API - Users API

## Create User [success]

### POST /v1/users

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| full_name | Full Name | false | data[attributes] |
| email | Email | true | data[attributes] |
| password | Password | true | data[attributes] |

### Request

#### Headers

<pre>Accept: application/vnd.api+json
Content-Type: application/x-www-form-urlencoded</pre>

#### Route

<pre>POST /v1/users</pre>

#### Body

<pre>data[attributes][full_name]=Richard+Chong&data[attributes][email]=test%40email.com&data[attributes][password]=123456</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users&quot; -d &#39;data[attributes][full_name]=Richard+Chong&amp;data[attributes][email]=test%40email.com&amp;data[attributes][password]=123456&#39; -X POST \
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
    "id": "470",
    "type": "users",
    "attributes": {
      "email": "test@email.com",
      "full_name": "Richard Chong"
    }
  }
}</pre>
