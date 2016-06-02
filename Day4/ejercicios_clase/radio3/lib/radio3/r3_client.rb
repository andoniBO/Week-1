require 'httparty'
require 'json'

class R3Client
	def initialize
		@base_url = "http://api.rtve.es/api/"
		@radio3_id = "849"
	end

	def get_programs(page)
		url = @base_url + 'cadenas/' + @radio3_id + '/programas.json'
		response = HTTParty.get(url)
		JSON.parse(response.body)['page']
	end

	def get_audios(program_id)
		url = @base_url + 'programas/' + program_id.to_s + '/audios.json'
		response = HTTParty.get(url)
		JSON.parse(response.body)['page']
	end
end