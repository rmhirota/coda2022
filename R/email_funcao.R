# Criando email com funções do blastula

email1 <- blastula::compose_email(
  body = blastula::md(paste0(
    "# Header 1\n",
    "## Header 2\n",
    "Este é um email _automatizado_ utilizando **blastula**!"
  )),
  header = "Workshop Coda",
  footer = Sys.Date()
) |>
  blastula::add_attachment("connect_examples/austin_home_sales.csv")

email2 <- blastula::prepare_test_message()


# Outras funções úteis:
blastula::add_attachment()
blastula::add_image()
blastula::add_imgur_image()
blastula::add_ggplot()
blastula::prepare_rsc_example_files()

dallas_home_sales <- txhousing |>
  dplyr::filter(city == "Dallas") |>
  dplyr::group_by(year) |>
  dplyr::summarize(total_sales = sum(sales, na.rm = TRUE))

blastula::render_email("connect_examples/connect-example-email.Rmd")



# Se você NÃO usar verificação em 2 fatores
blastula::smtp_send(
  email1,
  to = "re.hirota@gmail.com",
  from = "re.hirota@gmail.com",
  subject = "Teste blastula",
  credentials = blastula::creds("re.hirota@gmail.com", "gmail")
)

# Se você usar verificação em 2 fatores
# Criar primeiro uma chave
blastula::create_smtp_creds_key(
  id = "gmail",
  user = "re.hirota@gmail.com",
  host = "smtp.gmail.com",
  port = "465",
  use_ssl = FALSE
)
# Envio
blastula::smtp_send(
  email1,
  to = "re.hirota@gmail.com",
  from = "re.hirota@gmail.com",
  subject = "Teste blastula",
  credentials = blastula::creds_key("gmail")
)
