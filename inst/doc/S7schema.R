## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(S7schema)

## -----------------------------------------------------------------------------
ex_config <- system.file("examples/config.yml", package = "S7schema")
ex_schema <- system.file("examples/schema.json", package = "S7schema")

## -----------------------------------------------------------------------------
validate_yaml(file = ex_config, schema = ex_schema)

## -----------------------------------------------------------------------------
config <- S7schema(file = ex_config, schema = ex_schema)
print(config)

## -----------------------------------------------------------------------------
class(config)

## -----------------------------------------------------------------------------
config$my_config_var

## -----------------------------------------------------------------------------
config$my_config_var <- 2
validate(config)
print(config)

## ----error = TRUE-------------------------------------------------------------
try({
config$my_config_var <- "abc"
validate(config)
})

## ----eval = FALSE-------------------------------------------------------------
# write_config(
#   x = config,
#   path = "my/config.yml"
# )

