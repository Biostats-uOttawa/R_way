lang <- Sys.getenv("QUARTO_PROFILE")


# Render template
# Convert rendered PDF to PNG
if (!file.exists(paste0("images/cover/cover_", lang, ".png"))){
  library(tidyverse)
  library(quarto)
  library(magick)
  
pdf_file <- list.files(paste0("_book/", lang), pattern=".pdf", full.names = TRUE)
image_read_pdf(pdf_file, pages = 1) |>
  image_montage(geometry = "x1000+25+35", tile = 1, bg = "grey92", shadow = TRUE) |>
  image_convert(format = "png") |>
  image_write(paste0("images/cover/cover_", lang,".png"))
}