# coding: utf-8

class << ActiveAdmin::Comment
  def state
    where(:namespace => 'state').scoped
  end

  def comment
    where(:namespace => 'admin').scoped
  end
end

ActiveAdmin.register ActiveAdmin::Comment, as: 'StaffComments', title: '评论' do
  menu label: '评论'


  actions :show, :index

  scope :all, :default => true
  scope :comment
  scope :state

  # filter :author_id
  filter :author_id, label: '作者', as: :select, :collection => proc { Staff.select([:name, :id]) }
  filter :body, label: '内容'

  config.per_page = 100

  index title: '评论' do
    # seems I18n activerecord.attributes.active_admin.comment.* not working, hardcode zh_cn here
    column '时间', :sortable => :id do |c|
      c.created_at.strftime('%m-%d %H:%M')
    end

    column '作者', :sortable => :author_id do |c|
      c.author.name
    end

    column '报名表', :sortable => :resource_id do |c|
      f = c.resource
      span(class: f.gender_sym) { link_to f.name, admin_form_path(f) }
    end

    column '内容', :sortable => false do |c|
      span draw_tags([:state], false) if c.namespace == 'state'
      span link_to(c.body, admin_form_path(c.resource), :class => 'comment')
    end
  end
  
end
