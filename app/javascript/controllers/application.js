import { Application } from "@hotwired/stimulus"
// import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"
import OrdersController from "./orders_controller"

const application = Application.start()
console.log('application start js controllers')

application.debug = true
window.Stimulus = application

application.register("orders", OrdersController)

application.handleError = (error, message, detail) => {
  console.warn(message, detail)
  ErrorTrackingSystem.captureException(error)
}

export { application }
