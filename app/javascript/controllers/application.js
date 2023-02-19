import { Application } from "@hotwired/stimulus"

const application = Application.start()

console.log("Hello from application Stimulus!", application)
// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

application.handleError = (error, message, detail) => {
  console.warn(message, detail)
  ErrorTrackingSystem.captureException(error)
}

export { application }
