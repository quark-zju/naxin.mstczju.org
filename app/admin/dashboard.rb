# coding: utf-8

ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    # Here is an example of a simple dashboard with columns and panels.
    columns do
      column do
        panel "最近评论" do
          ul do
            ActiveAdmin::Comment.order('created_at DESC').first(16).map do |comment|
              li do
                [comment.author.name,
                link_to(comment.body.truncate(140), admin_form_path(comment.resource))].join(': ').html_safe
              end
            end
          end
          span link_to '更多评论', admin_staff_comments_path
        end
      end

      column do
        panel "统计" do
          counts = Hash[[*Form::GROUPS, 'all'].map {|s| [s.to_sym, {}]}]

          Form.nospam.each do |f|
            state_groups = []
            person_state = []

            f.state.select{|t| t.to_s['_']}.each do |gst|
              g, st = gst.to_s.split('_').map(&:to_sym)
              counts[g][st] ||= 0
              counts[g][st] += 1
              state_groups << g
              person_state << st
            end

            f.groups.each do |g|
              g = g.to_sym
              next if g.in? state_groups
              counts[g][:other] ||= 0
              counts[g][:other] += 1
            end

            person_state = person_state.sort.first || :other
            counts[:all][person_state] ||= 0
            counts[:all][person_state] += 1
          end

          div class: '' do
            table do
              thead do
                tr do
                  ['', *Form::STATES.sort, :other].map { |s| th { s.upcase } }
                end
              end
              tbody do
                [*Form::GROUPS, :all].map do |g|
                  tr do
                    td { b { g.upcase } }
                    [*Form::STATES.sort, :other].map { |s| td { counts[g][s] } }
                  end
                end
              end
            end
          end
        end
      end
    end
  end # content
end
