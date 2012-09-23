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

  config.batch_actions = false

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

    column '状态' do |c|
      f = c.resource
      tags = [*f.state, *(f.groups - f.state.map{|s| s[0..1].to_sym}).map{|s| "#{s}_unknown".to_sym}].sort
      subset = tags.reject{|t| t.to_s['_']}
      tags = subset unless subset.empty?
      draw_tags tags
    end

    column '内容', :sortable => false do |c|
      span draw_tags([:state], false) if c.namespace == 'state'
      span link_to(c.body, admin_form_path(c.resource) + "#active_admin_comment_#{c.id}", :class => 'comment')
    end
  end
  
end
