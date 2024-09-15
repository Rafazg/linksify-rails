namespace :link_processor do
  desc "Processa os links definidos em urls.rb"
  task process_links: :environment do
    puts "Iniciando o processamento dos links..."

    # Carregar o arquivo urls.rb da pasta public
    require_relative '../../config/urls'

    # Verifique se URLS está definido
    unless defined?(URLS)
      puts "Erro: URLS não está definido em urls.rb."
      exit 1
    end

    num_threads = 10
    threads = []


    URLS.each_slice((URLS.size / num_threads.to_f).ceil).each do |url_batch|
      threads << Thread.new do
        processor = LinkProcessor.new(url_batch)
        processor.process
      end
    end


    threads.each(&:join)

    puts "Processamento concluído!"
  end
end
