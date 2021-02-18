class LinksController < ApplicationController

  # {
  #   "links": [
  #     "https://ya.ru",
  #     "https://ya.ru?q=123",
  #     "funbox.ru",
  #     "https://stackoverflow.com/questions/11828270/how-to-exit-the-vim-editor"
  #   ]
  # }

  def add
    json_inpit = JSON.parse(request.raw_post)


    link = Link.new
    link.add(json_inpit["links"])


    render json: { params: json_inpit,  status: "ok" }
  end

  #127.0.0.1:3000/visited_domains?from=1545221231&to=1545217638
  def show_domains

    from = params[:from]
    to = params[:to]

    p from

    #JSON.
    #
    json='
    {
      "domains": [
        "ya.ru",
        "funbox.ru",
        "stackoverflow.com"
      ],
      "status": "ok"

    }'

    domains = ["ya.ru", "funbox.ru", "stackoverflow.com"]

    render json: { "domains": domains ,   status: "ok", from: from, to: to }
  end

  private
  def link_params
    params.require(:post).permit(:links)
  end

end
