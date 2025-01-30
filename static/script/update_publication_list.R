# copy/paste your client ID from https://orcid.org/developer-tools
orcid_client_id <- Sys.getenv("ORCID_APP_MANGAL")
# copy/paste your client secret from https://orcid.org/developer-tools
orcid_client_secret <- Sys.getenv("ORCID_SECRET_MANGAL")

orcid_request <- httr::POST(
    url = "https://orcid.org/oauth/token",
    config = httr::add_headers(
        `Accept` = "application/json",
        `Content-Type` = "application/x-www-form-urlencoded"
    ),
    body = list(
        grant_type = "client_credentials",
        scope = "/read-public",
        client_id = orcid_client_id,
        client_secret = orcid_client_secret
    ),
    encode = "form"
)

orcid_response <- httr::content(orcid_request)
Sys.setenv(ORCID_TOKEN = orcid_response$access_token)
Sys.getenv("ORCID_TOKEN")
rorcid::works("0000-0001-6619-9874")


orcids <- c(
    "0000-0002-3590-8161",  # david 
    "0000-0001-6619-9874",  # kevin 
    "0000-0002-0866-4376"   # steve 
) 

get_dois  <- function(id) {
    rorcid::works(id) |>
        rorcid::identifiers()  |>
        unique()
}

v_dois <- orcids |> lapply(get_dois)
 


pubs0 <- v_dois  |>
    unlist()  |>
    unique()  |> 
    rcrossref::cr_cn(format = "bibtex")


# remove data, preprint and correction
pubs <- pubs0[
    !grepl("ZENODO", pubs0) &
    !grepl("s43247-024-01938-y", pubs0) & 
    !grepl("rs\\.3\\.rs-3296860", pubs0)
]

lapply(pubs, write, "static/pubs_insil.bib", append = TRUE)

# then run 
# rm -f data/pubs.yaml
# pandoc static/pubs_insil.bib -s -f biblatex -t markdown > data/pubs.yaml
# sed -i -E 's/(issued: )([0-9]{4})-[0-9]{2}/\1\2/' data/pubs.yaml

