# Exercício: criar um email e enviar para a lista de pessoas presentes

id_sheets <- googlesheets4::as_sheets_id("1iQvp0ZXM-8tgqjzmbaO7CUq8bOYWveRiD2A_igdfssc")
lista_emails <- googlesheets4::read_sheet(id_sheets)

# Exemplos de emails
email <- blastula::prepare_test_message()
email <- blastula::compose_email(
  body = blastula::md(paste0(
    "# Header 1\n",
    "## Header 2\n",
    "Este é um email _automatizado_ utilizando **blastula**!"
  )),
  header = "Workshop Coda",
  footer = Sys.Date()
) |>
  blastula::add_attachment("connect_examples/austin_home_sales.csv")

# Envio
resposta_blastula <- blastula::smtp_send()


