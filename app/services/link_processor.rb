require 'net/http'
require 'json'

class LinkProcessor
  def initialize(urls)
    @urls = urls
  end

  def process
    Rails.logger.info "Iniciando o processamento dos links."
    threads = []

    @urls.each do |url|
      url = parse_url(url)
      next unless valid_url?(url)
      
      # Criando uma thread para processar cada link em paralelo
      threads << Thread.new { process_single_link(url) }
    end

    # Esperando todas as threads terminarem antes de continuar
    threads.each(&:join)

    Rails.logger.info "Processamento concluído."
  end

  private

  def process_single_link(url)
    Rails.logger.info "Processando o link: #{url}"
    product_data = fetch_product_data(url)
    
    if product_data
      Rails.logger.info "Dados do produto obtidos para #{url}: #{product_data.inspect}"
      product = Product.find_or_initialize_by(url: url)
      
      if product.update(product_data)
        Rails.logger.info "Produto atualizado com sucesso: #{product.inspect}"
      else
        Rails.logger.error "Falha ao atualizar o produto: #{product.errors.full_messages.join(', ')}"
      end
    else
      Rails.logger.warn "Nenhum dado de produto encontrado para #{url}"
    end
  end

  def parse_url(url)
    url.gsub(/\[|\]/, "") # Remove colchetes, se necessário
  end

  def valid_url?(url)
    uri = URI.parse(url)
    uri.kind_of?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def fetch_product_data(url)
    Rails.logger.info "Buscando dados do produto para #{url}.json"
    
    begin
      uri = URI.parse("#{url}.json")
      response = Net::HTTP.get_response(uri)
      
      if response.is_a?(Net::HTTPSuccess)
        data = JSON.parse(response.body)
        
        product_data = data.dig('product')
        
        if product_data
          {
            'title' => product_data['title'],
            'price' => product_data.dig('variants', 0, 'price'),  # Ajuste conforme a estrutura exata dos dados de preço
            'published_at' => product_data['published_at'],
            'image_url' => product_data.dig('images', 0, 'src')
          }
        else
          Rails.logger.warn("Nenhum dado de produto encontrado para #{url}")
          nil
        end
      else
        Rails.logger.warn("Resposta não bem-sucedida para #{url}. Código de status: #{response.code}")
        nil
      end 
    rescue URI::InvalidURIError => e
      Rails.logger.error("URL inválida: #{url}. Erro: #{e.message}")
      nil
    rescue SocketError => e
      Rails.logger.error("Erro de conexão ao buscar dados do produto de #{url}: #{e.message}")
      nil
    rescue JSON::ParserError => e
      Rails.logger.error("Erro ao analisar JSON da resposta para #{url}: #{e.message}")
      nil
    rescue StandardError => e
      Rails.logger.error("Erro ao buscar dados do produto de #{url}: #{e.message}")
      nil
    end
  end
end
