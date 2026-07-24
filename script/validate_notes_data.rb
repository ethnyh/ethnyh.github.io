#!/usr/bin/env ruby
# frozen_string_literal: true

require "yaml"

path = File.expand_path("../_data/notes.yml", __dir__)
abort "Missing notes data file: _data/notes.yml" unless File.file?(path)

courses = YAML.safe_load(File.read(path))
abort "_data/notes.yml must contain a list of courses" unless courses.is_a?(Array)
abort "_data/notes.yml must contain at least one course" if courses.empty?

total_notes = 0

courses.each_with_index do |course, course_index|
  label = "course #{course_index + 1}"
  abort "#{label} must be a map" unless course.is_a?(Hash)

  title = course["course"]
  notes = course["notes"]

  abort "#{label} is missing course" unless title.is_a?(String) && !title.empty?
  abort "#{title} notes must be a non-empty list" unless notes.is_a?(Array) && !notes.empty?

  notes.each_with_index do |note, note_index|
    note_label = "#{title} note #{note_index + 1}"
    abort "#{note_label} must be a map" unless note.is_a?(Hash)

    note_title = note["title"]
    file = note["file"]

    abort "#{note_label} is missing title" unless note_title.is_a?(String) && !note_title.empty?
    abort "#{note_label} is missing file" unless file.is_a?(String) && !file.empty?
    abort "#{note_label} file should start with /assets/lecture_note/" unless file.start_with?("/assets/lecture_note/")
    abort "#{note_label} file does not exist: #{file}" unless File.file?(File.join(__dir__, "..", file.delete_prefix("/")))
  end

  total_notes += notes.length
end

expected_total = 66
abort "Expected #{expected_total} notes, found #{total_notes}" unless total_notes == expected_total

puts "Validated #{courses.length} courses and #{total_notes} notes"
