# require modules here
require "yaml"


def load_library(file_path)
  require "yaml"
  hash = YAML.load_file("#{file_path}")
  new_hash = {}
  hash.each do |meaning, emoticon|
    new_hash["get_meaning"] ||= {}
    new_hash["get_emoticon"] ||= {}
    new_hash["get_meaning"][emoticon[1]] = meaning 
    new_hash["get_emoticon"][emoticon[0]]= emoticon[1]
  end 
  new_hash
end

def get_japanese_emoticon(path, emotican)
  hash = load_library(path)
  if hash["get_emoticon"][emotican] == nil 
    "Sorry, that emoticon was not found"
  else 
    hash["get_emoticon"][emotican]
  end 
end

def get_english_meaning(path, emotican)
 hash = load_library(path)
  if hash["get_meaning"][emotican] == nil 
    "Sorry, that emoticon was not found"
  else 
    hash["get_meaning"][emotican]
  end 
end


