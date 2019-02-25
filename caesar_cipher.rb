require 'sinatra'
require 'sinatra/reloader'

get '/' do
  result = caesar_cipher(params["string"], params["shift"].to_i)
  erb :index, :locals => {:result => result}
end

def caesar_cipher(string, x)
  return string if string.nil?
  string = string.split("")
  j = 0
  string.each do |i|
    if i =~ /[A-Z]/
      i = (i.ord) + x.to_i
      if i > 90
        i = i - 26
      end
    elsif i =~ /[a-z]/
      i = (i.ord) + x.to_i
      if i > 122
        i = i - 26
      end
    end
    string[j] = i.chr
    j = j + 1
  end
  new_string = string.join
end
