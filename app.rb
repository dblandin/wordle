require 'rubygems'
require 'sinatra'
require 'haml'
require './lib/word_frequency_report'

# Helpers
require './lib/render_partial'

# Set Sinatra variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, 'views'
set :public_folder, 'public'
set :haml, {format: :html5}

# Application routes
get '/' do
  haml :index
end

post '/analyze' do
  @body           = params[:body]
  @exclude_common = !!params[:exclude_common]

  report = WordFrequencyReport.new(@body, exclude_common: @exclude_common)

  @results    = report.analyze
  @word_count = report.word_count

  haml :report
end
