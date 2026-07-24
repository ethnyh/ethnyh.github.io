#!/usr/bin/env ruby
# frozen_string_literal: true

require "yaml"

path = File.expand_path("../_data/music.yml", __dir__)
abort "Missing music data file: _data/music.yml" unless File.file?(path)

tracks = YAML.safe_load(File.read(path))
abort "_data/music.yml must contain a list" unless tracks.is_a?(Array)

tracks.each_with_index do |track, index|
  label = "track #{index + 1}"
  abort "#{label} must be a map" unless track.is_a?(Hash)

  title = track["title"]
  file = track["file"]
  description = track["description"]

  abort "#{label} is missing title" unless title.is_a?(String) && !title.empty?
  abort "#{label} is missing file" unless file.is_a?(String) && !file.empty?
  abort "#{label} file should start with /assets/music/" unless file.start_with?("/assets/music/")
  abort "#{label} file does not exist: #{file}" unless File.file?(File.join(__dir__, "..", file.delete_prefix("/")))
  abort "#{label} description must be a string" if track.key?("description") && !description.is_a?(String)
end

puts "Validated #{tracks.length} tracks"
