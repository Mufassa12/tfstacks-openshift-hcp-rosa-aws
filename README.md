# tfstacks-openshift-hcp-rosa-aws

## Example cURL Commands

### Obtain OAuth Token

```
curl -u "cluster-admin:" -kv -H "X-CSRF-Token: xxx" \
     'https://oauth.e4t1w3t5o7q5r6j.v9wp.p3.openshiftapps.com/oauth/authorize?client_id=openshift-challenging-client&response_type=token'

     # Location header contains access token
```

### Example API Request with bearer
```
curl https://api.e4t1w3t5o7q5r6j.v9wp.p3.openshiftapps.com:443/apis/project.openshift.io/v1/projects/default \
     -H "Content-Type: application/json" \
     -H "Authorization: Bearer <SomeOAuthToken>" \
     -H "Accept: application/json"
```
