class LegalPagesController < BaseController
  def show
    @legal_page = LegalPageTranslation.friendly.find(params["id"]).legal_page 
    redirect_to root_path unless @legal_page.is_visible
  end
end
