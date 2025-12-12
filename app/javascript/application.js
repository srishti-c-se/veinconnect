// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

import { Application } from "@hotwired/stimulus"

const application = Application.start()
application.debug = false
window.Stimulus = application  // Make Stimulus globally available

console.log('✅ Stimulus Application started')

export { application }

document.addEventListener('DOMContentLoaded', () => {
  console.log('DOM loaded')

  if (window.Stimulus) {
    console.log('✅ Stimulus is available:', window.Stimulus)
  } else {
    console.log('❌ Stimulus NOT found')
  }
})
