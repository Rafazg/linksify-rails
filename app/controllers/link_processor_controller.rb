class LinkProcessorController < ApplicationController
  def start
  end

  def process_links
    processor = LinkProcessor.new(URLS)
    processor.process
    render plain: 'Links processados com sucesso!'
  end
end