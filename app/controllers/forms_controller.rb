# coding: utf-8
#
class FormsController < ApplicationController

  before_filter :before_deadline, :only => [ :new, :create ]

  def index
    params[:page].try { |p| cookies[:page] = p.to_i > 0 ? p : 1 }
    @forms = Form.order('id DESC').paginate(:page => cookies[:page], :per_page => 10) if staff?
    @form = Form.find_by_id(cookies[:form_id]) if cookies[:form_id]
    @form = nil unless is_remembered?
    @deadline_exceed = deadline?
  end

  def show
    # only staff can view show page (and edit comments)
    if staff?
      @form = Form.find(params[:id])
    else
      redirect_to forms_url, flash: { error: '对不起，您不能这样做' }
    end
  end

  def new
    @last_form = Form.find_by_id(cookies[:form_id]) if cookies[:form_id]
    @form = Form.new
  end

  def edit
    @form = Form.find(params[:id] || cookies[:form_id])

    unless is_remembered? 
      redirect_to forms_url, flash: { error: '对不起，您不能编辑这份报名表' }
    end
  end

  def create
    @form = Form.new(params[:form])

    if @form.save
      remember
      redirect_to forms_url, notice: '恭喜，报名表已经成功提交 :)'
    else
      render action: "new"
    end
  end

  def update
    @form = Form.find(params[:id] || cookies[:form_id])
    
    # check staff
    if staff?
      # smart update form according to legacy_comments
      comments = String.new(@form.comments.to_s)
      new_comments = params[:form][:comments]

      if comments[params[:old_comments]]
        comments.sub! params[:old_comments], new_comments
      else
        comments << "\r\n-----\r\n#{new_comments}"
      end

      if @form.update_attributes(comments: comments) 
        redirect_to forms_url, notice: '注释更新成功 :)'
      else
        render action: "edit"
      end
    else
      # check belonging
      if is_remembered?
        params[:form].try { |p| p[:comments] = nil }
        if @form.update_attributes(params[:form])
          redirect_to forms_url, notice: '报名表更新成功 :)'
        else
          render action: "edit"
        end
      else
        redirect_to forms_url, flash: { error: '对不起，现在不能编辑这份报名表，您可以重新填写一份新的报名表' }
      end
    end
  end

  def destroy
    if staff?
      @form = Form.find(params[:id])
      @form.destroy

      redirect_to forms_url 
    else
      redirect_to forms_url, flash: { error: '对不起，您不能这样做' }
    end
  end

  private

  def staff?
    if params[:staff] == 'yEs'
      # set staff
      session[:staff] = true
      redirect_to forms_url, notice: '已获得 staff 身份'
    elsif params[:staff]
      # cancel staff
      session[:staff] = nil
    end
    session[:staff] == true
  end

  def deadline?
    Date.today > Date.civil(2011,9,30)
  end

  def before_deadline
    if deadline?
      redirect_to forms_url, notice: '本次纳新报名已截止，欢迎关注 MSTC 的其他活动'
    end
  end

  def remember
    cookies.permanent[:form_id] = @form.id
    cookies.permanent.signed[:form_hash] = @form.cookie_hash = random_hash 
    @form.save
  end

  def is_remembered?
    return nil unless @form
    (cookies[:form_id] || '-').to_s == @form.id.to_s and (cookies.signed[:form_hash] || '-').to_s == @form.cookie_hash.to_s
  end

  def random_hash
    rand.hash.abs.to_s(36)
  end

end
