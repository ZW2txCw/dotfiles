#!/usr/bin/env ruby
# frozen_string_literal: true

require 'open3'
require 'pathname'
require 'shellwords'

CONTROL = '/tmp/mplayer-control'
URL = /^Playing\s+(?<target>.+)\.$/
NAME = /^Name\s+:\s+(?<target>.+)/
TRACK = /^ICY.+StreamTitle='(?<target>.*?)';/
LIMIT = 196

# documentation
class Radio
  def initialize
    p = Pathname(ARGV[0]).expand_path.to_s
    c = File.read(p).split("\n").reject { |i| i.start_with?('#') }
    s = Struct.new(:path, :content, :number, :url, :name, :track, :mpl, :bar) do
      def ind = "#{content.index(url).next}/#{number}"
    end
    @d = s.new(p, c, c.size, '', '', '')
  end

  def bar
    font = 'Iosevka Nerd Font:style=Regular:size=12'
    "lemonbar -d -g 1631x23+289+0 -f '#{font}' -B '#00000000' -o 1"
  end

  def mplayer
    ["mplayer -quiet -nolirc -slave -input file=#{CONTROL}",
     "-playlist  #{@d.path}"].join(' ')
  end

  def run
    File.exist?(CONTROL) || `mkfifo #{CONTROL}`
    Open3.popen3 bar do |stdin,|
      @d.bar = stdin
      send_to_bar ' %{F#757d75}(Ruby): Starting MPlayer … '
      Open3.popen3 mplayer do |_, stdout,|
        @d.mpl = stdout
        parse_output
      end
    end
  end

  def parse_output
    while (line = @d.mpl.gets)
      line = line.strip
      next if line.empty?

      line = line.valid_encoding? ? line : "ICY Info: StreamTitle='';"
      parse line
    end
  end

  def parse(line)
    { url: URL, name: NAME, track: TRACK }.each do |k, v|
      next unless line.match?(v)

      @d[k] = line.match(v)[:target]
      next unless %i[name track].include?(k)

      refresh @d.ind, @d.name, @d.track.strip.squeeze(' ').gsub('_', ' ')
    end
  end

  def refresh(ind, name, track)
    s = [ind, name, track].map(&:length).sum
    track = track.empty? ? '… ' : "#{track} "
    track = s > LIMIT ? "#{track[0, track.length - (s - LIMIT)]} … " : track
    send_to_bar " %{F#bf616a}#{ind} %{F#ebcb8b}#{name} %{F#87875f}#{track}"
  end

  def send_to_bar(str)
    @d.bar.write "%{B#30302c}#{str}%{B-}"
  end

  def send_to_dunst(str)
    `dunstify -u low -h string:x-dunst-stack-tag:radio #{str.shellescape}`
  end
end

if $PROGRAM_NAME == __FILE__
  if ARGV.empty?
    puts 'Usage: radio.rb <playlist>'
    exit
  end
  Radio.new.run
end
