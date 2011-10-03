# coding: utf-8

namespace :db do
  desc "Fetch users' forum statistics and fill them in staff comments"
  task :comments => :environment do
    require 'open-uri'
    
    class String
      def update_tag!(tag, content)
        return unless content.present?

        regex = /\[#{tag}\].*\[\/#{tag}\]/m
        content_with_tag = "[#{tag}]\n#{content}\n(#{DateTime.now})[/#{tag}]".gsub("\r", "").gsub("\n\n", "\n")

        if self[regex]
          # replace
          self.gsub!(regex, content_with_tag)
        else
          # append
          self << "\n#{content_with_tag}\n"
        end
      end
    end

    Form.all.each do |f|
      puts "Processing form: #{f.name} ..."
      comments = f.comments.to_s.dup
      f.forum_id.split.each do |id|
        next if [ 'CC98' ].include? id.upcase

        puts "  Processing id: #{id} ..."

        begin
          # lookup cc98 id
          puts "    Looking up at CC98 ..."
          cc98_info = ''
          doc = Nokogiri::HTML(open("http://www.cc98.org/dispuser.asp?name=#{id}"))
          doc.xpath('//body/table[@class="tableborder1"]/tr/td[@class="tablebody1"][@align="lift"]').each do |e|
            cc98_info << (e.to_s.gsub('<br>'," | ").gsub(/<[^>]+>/,'') + "\n")
          end
          comments.update_tag! "CC98:#{id}", cc98_info

          # lookup freecity id
          puts "    Looking up at Freecity ..."
          freecity_info = ''
          doc = Nokogiri::HTML(open("http://www.zju88.org/cgi-bin/bbsqry?userid=#{id}"))
          doc.css('pre').each { |e| freecity_info << "#{e.content}\n" }
          comments.update_tag! "Freecity:#{id}", freecity_info.encode
        rescue
          puts "    Error, ignore."
        end
      end
      
      f.comments = comments
      puts "  Saving: #{f.save}"
    end # Form.all
  end
end

