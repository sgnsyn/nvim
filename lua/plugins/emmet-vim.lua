return {
  {
    "mattn/emmet-vim",
    config = function()
      vim.g.user_emmet_leader_key = ","

      vim.g.user_emmet_settings = {
        variables = {
          lang = 'ja'
        },
        html = {
          default_attributes = {
            option = { value = vim.NIL },
            textarea = { id = vim.NIL, name = vim.NIL, cols = 10, rows = 10 }
          },
          snippets = {
            ["html:5"] = table.concat({
              "<!DOCTYPE html>",
              "<html lang=\"${lang}\">",
              "<head>",
              "\t<meta charset=\"${charset}\">",
              "\t<title></title>",
              "\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">",
              "</head>",
              "<body>",
              "\t${child}|",
              "</body>",
              "</html>"
            }, "\n")
          }
        }
      }
    end
  }
}
