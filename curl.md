REQUEST TOKEN
curl -X POST -d "grant_type=client_credentials&client_id=<CLIENT_ID>&client_secret=<CLIENT_SECRET>&token_type=jwt" https://api.edx.org/oauth2/v1/access_token

This gives us an AuthZ token to use when requesting more data.

REQUEST COURSES VIA CATALOG ID
curl -X GET -H "Authorization: JWT <TOKEN>" https://api.edx.org/catalog/v1/catalogs/240

This gives us the data for catalog 240, which seems to be the only catalog available.
