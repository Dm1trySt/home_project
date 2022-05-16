// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"

import '@popperjs/core'
import 'bootstrap/js/dist/dropdown'

Rails.start()
Turbolinks.start()
