# To import:
# source('/config/keys.R')

edx.client.id <- "<id>"
edx.client.secret <- "<secret>"
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
