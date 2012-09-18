module FormsHelper
  def draw_tags(tags, short = true, base_tag = :group_tag)
      tags.map do |s|
        name, klass = s.to_s.split('_')
        klass ||= name
        name = name[0...(name.length ** 0.4).round] if short
        content_tag(:span, :class =>"#{base_tag} #{klass}") { name.upcase }
      end.join(' ').html_safe
  end
end
