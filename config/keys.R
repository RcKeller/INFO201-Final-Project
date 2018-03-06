# To import:
# source('/config/keys.R')

edx.client.id <- "DiMLaAmnQkVChrDcBJtf0uND1sjpJlTDTt4GcTJK"
edx.client.secret <- "7brePxZVUqqyyYnzP635SksMn9mOjHdi1l76bjYUMzTjjsjsw5VvmMzV11aJ0Vh6Thg7Jwale9rgaWefOy6X73GVHqeCdy6LPFUbF1GqmmjPZALO970aUK1vMVFmYeBV"
edx.request.token.uri <- "https://api.edx.org/oauth2/v1/access_token"
edx.request.token.payload <- function (id, secret) {
  payload <- sprintf("grant_type=client_credentials&client_id=%s&client_secret=%s&token_type=jwt", id, secret)
  #payload <-list(
   # grant_type = "client_credentials",
    #client_id = id,
    #client_secret = secret,
    #token_type = "jwt"
  # )
  return(payload)
}
