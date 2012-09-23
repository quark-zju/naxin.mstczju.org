# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
Mime::Type.register "text/richtext", :rtf
Mime::Type.register 'application/x-rar-compressed', :rar

# from http://blogs.msdn.com/b/vsofficedeveloper/archive/2008/05/08/office-2007-open-xml-mime-types.aspx
%w(
doc application/msword
dot application/msword
docx application/vnd.openxmlformats-officedocument.wordprocessingml.document
dotx application/vnd.openxmlformats-officedocument.wordprocessingml.template
xls application/vnd.ms-excel
xlt application/vnd.ms-excel
xla application/vnd.ms-excel
xlsx application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
xltx application/vnd.openxmlformats-officedocument.spreadsheetml.template
ppt application/vnd.ms-powerpoint
pot application/vnd.ms-powerpoint
pps application/vnd.ms-powerpoint
ppa application/vnd.ms-powerpoint
pptx application/vnd.openxmlformats-officedocument.presentationml.presentation
potx application/vnd.openxmlformats-officedocument.presentationml.template
ppsx application/vnd.openxmlformats-officedocument.presentationml.slideshow
).each_slice(2).group_by(&:second).each do |mime, types|
  exts = types.map(&:first).map(&:to_sym)
  Mime::Type.register mime, exts[0], [], exts[1..-1]
end

