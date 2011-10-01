# coding: utf-8

class PagesController < ApplicationController
  def about

  end

  def unstaff
    session[:staff] = nil
    redirect_to forms_url, notice: '已取消 staff 身份'
  end

end
