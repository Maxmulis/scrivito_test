class SearchPageController < CmsController
  HITS_PER_PAGE = 10

  def index
    @query = params[:q] || ''
    @hits = []

    if @query.present?
      search_query = Obj.where(:*, :contains_prefix, @query)
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

  private

  def offset
    params[:offset].to_i
  end
end