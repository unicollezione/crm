import "@hotwired/turbo-rails"
import jquery from 'jquery'
import './controllers'
import "@hotwired/turbo-rails"
import "controllers"

window.jQuery = jquery
window.$ = jquery

require('select2')()
console.log("Hello, app/js/appplication.js Stimulus!!!")
