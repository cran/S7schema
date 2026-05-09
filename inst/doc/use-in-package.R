## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(S7schema)

## -----------------------------------------------------------------------------
schema_path <- system.file("examples/schema.json", package = "S7schema")

## -----------------------------------------------------------------------------
my_config_class <- S7::new_class(
  name = "my_config_class",
  parent = S7schema::S7schema,
  constructor = function(file) {
    S7::new_object(
      .parent = S7schema::S7schema(
        file = file,
        schema = system.file("examples/schema.json", package = "S7schema")
      )
    )
  }
)

## -----------------------------------------------------------------------------
config_path <- system.file("examples/config.yml", package = "S7schema")
x <- my_config_class(file = config_path)
print(x)

## -----------------------------------------------------------------------------
x$my_config_var

## -----------------------------------------------------------------------------
class(x)

## ----error = TRUE-------------------------------------------------------------
try({
x$my_config_var <- "not a number"
S7::validate(x)
})

## -----------------------------------------------------------------------------
tmp <- tempfile(fileext = ".yml")
x$my_config_var <- 42
write_config(x, path = tmp)
readLines(tmp)

## -----------------------------------------------------------------------------
md <- document_schema(schema_path)
cat(md)

## -----------------------------------------------------------------------------
md <- document_schema(schema_path, header_start_level = 3)
cat(md)

