class PagesController < BaseController
  def index
    @page = @pages["home"]
    set_sections
  end

  def show
    @page = @pages["about"]
    set_sections
  end

  private

  def set_sections
    sections = @page.sections.all_visible
    @featured_section = sections.first
    @other_sections = sections.where.not(id: @featured_section.id)
  end
end
