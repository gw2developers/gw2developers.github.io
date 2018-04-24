---
layout: guide
summary: Access authenticated player data with the API.
image: /assets/images/authentication.svg
---

APIs which require authentication need to be passed an API key belonging to the account to be accessed.
You can pass the API key as HTTP Header `Authentication: Bearer <API key>` or as `?access_token=<API key>`
query parameter.

## Generating an API key

Users can manage their API keys on [account.arenanet.com/applications](https://account.arena.net/applications).
When creating a new API key, different scopes can be selected, limiting the data that can be accessed with this API key.


## Validating API keys

After a user has submitted a new API key to your application, you should use `/v2/tokeninfo` to verify it has
all the permissions needed by you, and otherwise request the user to provide a new API key.

You should always list all required permissions before asking the user for their API key.

## Handling CORS

CORS (short for Cross-Origin Resource Sharing) prevents you to add custom HTTP headers to AJAX requests, because the API doesn't support [preflight requests][preflight-requests]. If you want to pass an API key from within a browser, you have to use the `?access_token=<API key>` query string instead.

## Authentication related errors

Errors related to authentication have the HTTP status code `403 Forbidden`. The following errors can occur:

{% assign authErrors = site.data.errors | where:'type','authentication' %}
<ul>
{% for error in authErrors %}
  <li>
    <strong>{{ error.text }}</strong><br>
    {{ error.description }}
  </li>
{% endfor %}
</ul>

[preflight-requests]: https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS#Preflighted_requests