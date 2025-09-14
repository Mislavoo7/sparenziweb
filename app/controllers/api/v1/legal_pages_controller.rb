class Api::V1::LegalPagesController < Api::V1::BaseController
  # GET /api/v1/legal_pages
  def index
    @legal_pages = LegalPage.all_visible
    render json: {
      success: true,
      legal_pages: @legal_pages.map do |legal|
        make_body(legal)
      end
    }, status: :ok
  end

  private 


  def make_body(legal)
    obj_legal = {
      id: legal.id
    }
    legal.legal_page_translations.each do |lt|
      obj_legal[lt.locale] = {
        slug: lt.slug,
        title: lt.title,
        content: lt.content,
        created_at: lt.created_at,
        updated_at: lt.updated_at
      }
    end
    return obj_legal
  end
end
