require 'radio3/version'
require 'radio3/r3_client'

module Radio3
  def self.get_programs(page)
  	data = R3Client.new.get_programs(page)
  	data['items'].each do |item|
  		puts item['name'] + ': ' + item['d']
  	end
  	puts "----------------------------------------------> (page #{data['number']} of #{data['totalPages']})"
  end
  def self.get_audios(program_id)
  	data = R3Client.new.get_audios(program_id)
  	data['items'].each do |item|
  		puts item['longTitle'] << ': ' << item['qualities'][0]['filePath']
  	end
  	puts "----------------------------------------------> (page #{data['number']} of #{data['totalPages']})"
  end
end
