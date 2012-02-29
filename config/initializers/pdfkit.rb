PDFKit.configure do |config|
  #config.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s if RAILS_ENV == 'production'  #heroku

  config.wkhtmltopdf = 'C:\dev\rails\wkhtmltopdf\wkhtmltopdf.exe'
  #config.wkhtmltopdf = 'C:/Program Files (x86)/wkhtmltopdf'
   config.default_options = {
     :page_size => 'Legal',
     :print_media_type => true
   }
  # config.root_url = "http://localhost" # Use only if your external hostname is unavailable on the server.
end