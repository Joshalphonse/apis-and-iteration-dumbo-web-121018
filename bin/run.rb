#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome #done
character = get_character_from_user #done
show_character_movies(character)
