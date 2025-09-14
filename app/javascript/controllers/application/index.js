import { Application } from "@hotwired/stimulus"
import Rails from "@rails/ujs"
import SortWithUpdateController from "./sort_with_update_controller"
import FiltersController from "./filters_controller"
//import NoticesController from "./notices_controller";
Rails.start()

export function startApplication() {
  const application = Application.start()
  application.debug = false
  window.AdminStimulus = application

  application.register("sort-with-update", SortWithUpdateController)
  application.register("filters", FiltersController)
}
