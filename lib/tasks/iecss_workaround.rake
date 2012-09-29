# coding: utf-8

require 'fileutils'

namespace :assets do
  task :workaround => :environment do
    path = Rails.root.join('public', 'a')
    css  = Dir[path.join('*.css')]

    system('sed', '-i', "s/startColorstr='#fff'/startColorstr='#ffffff'/gi", *css)
    FileUtils.rm_f (css.map{|f| "#{f}.gz"})

    css.each do |file|
      system 'bash', '-c', "gzip -c #{file} > #{file}.gz"
    end

  end
end

