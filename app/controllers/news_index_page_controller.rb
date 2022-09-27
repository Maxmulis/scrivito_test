class NewsIndexPageController < CmsController
  HITS_PER_PAGE = 10

  def index
    @autocomplete_path = suggestions_url
    @query = params[:q] || ''
    @hits = []

    if @query.present?
      now = Time.current
      search_query = NewsPage.where(:*, :contains_prefix, @query).
      and(:valid_from, :is_less_than, now).
      and(:valid_until, :is_greater_than, now).
      and(:_path, :starts_with, '/news/')
      # only subpages of newsindex
      search_query.batch_size(HITS_PER_PAGE).offset(offset)

      @hits = search_query.take(HITS_PER_PAGE)
      @total = search_query.size

      if offset > 0
        @previous_page = scrivito_path(@obj, q: @query, offset: offset - HITS_PER_PAGE)
      end

      if @total > offset + HITS_PER_PAGE
        @next_page = scrivito_path(@obj, q: @query, offset: offset + HITS_PER_PAGE)
      end
    end
  end

  def autocomplete
    # accepts query parameter
    query = params[:q] || ''
    # calls Newspage.all.suggest(query)
    suggestions = NewsPage.all.suggest(query)
    # returns array of strings as json
    render json: suggestions
  end

  private

  def offset
    params[:offset].to_i
  end
end
