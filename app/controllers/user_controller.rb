require 'prawn'

class UserController < ApplicationController

  def index
  end

  def generate_pdf
    pdf = Prawn::Document.new
    pdf.text "Testing if this creates a PDF"
    send_data pdf.render
  end

end
