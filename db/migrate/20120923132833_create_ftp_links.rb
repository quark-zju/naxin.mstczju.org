# coding: utf-8

LINKS = if not defined?(DATA)
  File.read(__FILE__).lines.inject(nil) { |s, l| s.nil? ? (l == "__END__\n" ? '' : nil) : s + l }
else
  DATA
end.lines.to_a.map(&:chomp)

class CreateFtpLinks < ActiveRecord::Migration
  def migrate(direction)
    super

    return if direction == :down

    LINKS.map do |link|
      name = File.basename(link)
      { :year => link[/Year[^\d]*(\d+)/, 1].to_i,
        :path => link,
        :name => name,
        :note => name[/面试Log/] && '推荐',
        :tags => [ case name
                   when /问题/, /面试/, /08.03版/, /recru/i
                     :interview
                   when /策划/, /讨论的问题/, /聊天/, /讨论/, /安排/, /会议/
                     :plan
                   when /拒/, /通知/
                     :notification
                   when /总结/
                     :summary
                   when /宣讲/, /ppt$/i, /邀请/, /介绍/, /form/i, /报名/, /海报/, /MSTC_Eng/, /文字/, /pptx$/, /poster/i, /ticket/i, /宣传/, /新闻稿/
                     :advertising
                   else
                     nil
                   end]
      }
    end.each(&FtpLink.method(:create!))
  end

  def change
    create_table :ftp_links do |t|
      t.string  :name, null: false
      t.string  :path, null: false
      t.integer :year, null: false
      t.integer :tags, null: false, default: 0
      t.string  :note

      t.timestamps
    end
  end
end

__END__
DOCs/Year.2005/05.招新/05招新宣讲会策划书.doc
DOCs/Year.2005/05.招新/浙大MSTC新会员邀请函.pdf
DOCs/Year.2006/06.03.15_宣传总结报告_windreamer转移/03-04/2004学年招新工作总结040927.doc
DOCs/Year.2006/06.03.15_宣传总结报告_windreamer转移/03-04/MSTC@ZJG_招新活动总结BG_20040925.doc
DOCs/Year.2006/06.03.15_宣传总结报告_windreamer转移/05/050402MSTC招新活动总结.doc
DOCs/Year.2006/06.03.15_宣传总结报告_windreamer转移/05/050409招新活动总结.doc
DOCs/Year.2006/06.03.15_宣传总结报告_windreamer转移/公文/浙大MSTC新会员邀请函.pdf
DOCs/Year.2006/06.03.15_宣传总结报告_windreamer转移/宣传/文章/圣诞Party新闻稿.doc
DOCs/Year.2006/06.09.招新/06.09.16会议总结.doc
DOCs/Year.2006/06.09.招新/06.09.22_MSTC招新报名表_萝卜/MSTC_Application_Form.doc
DOCs/Year.2006/06.09.招新/06.10.12_MSTC_2006_招新宣讲会_PPT/MSTC 2006.ppt
DOCs/Year.2006/06.09.招新/06宣讲会流程.doc
DOCs/Year.2006/06.09.招新/2006招新总结.doc
DOCs/Year.2006/06.09.招新/Culture2.0.ppt
DOCs/Year.2006/06.09.招新/Mstc2006招新宣讲会策划书之紫金港篇.doc
DOCs/Year.2006/06.09.招新/Mstc2006招新宣讲会策划书之紫金港篇2.doc
DOCs/Year.2006/06.09.招新/招新-pp.ppt
DOCs/Year.2006/06.招新/宣传/BBS宣传稿/2006_MSTC招新BBS宣传稿.doc
DOCs/Year.2006/06.招新/宣讲会/2006微软学生夏令营_pomme.ppt
DOCs/Year.2006/06.招新/宣讲会/Culture_Neptunee.ppt
DOCs/Year.2006/06.招新/宣讲会/招新-pieerpeng.ppt
DOCs/Year.2006/06.招新/宣讲会/游戏规则和个人介绍.ppt
DOCs/Year.2006/06.招新/宣讲会/猜数字游戏介绍.doc
DOCs/Year.2006/06.招新/总结/2006[1].10招新总结.doc
DOCs/Year.2006/06.招新/报名表/MSTC_Application_Form.doc
DOCs/Year.2006/06.招新/策划/Mstc2006招新宣讲会策划书之紫金港篇.doc
DOCs/Year.2006/06.招新/策划/事项安排.doc
DOCs/Year.2007/07.09.招新/2007 MSTC秋季纳新活动策划书.doc
DOCs/Year.2007/07.09.招新/MSTC 2003-2007.ppt
DOCs/Year.2007/07.09.招新/MSTC宣讲2007(初稿).ppt
DOCs/Year.2007/07.09.招新/poster.rar
DOCs/Year.2007/07.09.招新/ticket.pdf
DOCs/Year.2007/07.09.招新/纳新申请表/MSTC_Application_Form.doc
DOCs/Year.2008/08.09.Autumn招新@MSTC/08.09.18.面试资料汇总_from_kid_laptop.rar
DOCs/Year.2008/08.09.Autumn招新@MSTC/2008Summer纳新讨论稿.docx
DOCs/Year.2008/08.09.Autumn招新@MSTC/宣讲会/Dukeland 讲俱乐部架构/MSTC组织架构与How To Join（2008秋季纳新宣讲会）_1.1.ppt
DOCs/Year.2008/08.09.Autumn招新@MSTC/宣讲会/pluskid 讲俱乐部技术文化/Tech on MSTC.pptx
DOCs/Year.2008/08.09.Autumn招新@MSTC/宣讲会/sleepyworm 讲俱乐部文化/ppt for MSTC culture show.ppt
DOCs/Year.2008/08.09.Autumn招新@MSTC/宣讲会/宣讲会开场之间的 ppt.ppt
DOCs/Year.2008/08.09.Autumn招新@MSTC/宣讲会/宣讲会流程.txt
DOCs/Year.2008/08.09.Autumn招新@MSTC/宣讲会/宣讲会策划.doc
DOCs/Year.2008/08.09.Autumn招新@MSTC/报名表/MSTC 报名表（中文）正反面.zip
DOCs/Year.2008/08.09.Autumn招新@MSTC/报名表/MSTC_English.doc
DOCs/Year.2008/08.09.Autumn招新@MSTC/招新面试策划.doc
DOCs/Year.2008/08.09.Autumn招新@MSTC/面试/08.09.18.面试资料汇总/问题汇总/08.03版.doc
DOCs/Year.2008/08.09.Autumn招新@MSTC/面试/08.09.18.面试资料汇总/问题汇总/MSTC recruitment.doc
DOCs/Year.2008/08.09.Autumn招新@MSTC/面试/08.09.18.面试资料汇总/问题汇总/会议需要讨论的问题.doc
DOCs/Year.2008/08.09.Autumn招新@MSTC/面试/09.09 TG 面试需求分析会议/会议需要讨论的问题.docx
DOCs/Year.2008/08.09.Autumn招新@MSTC/面试/09.09 TG 面试需求分析会议/会议需要讨论的问题.pdf
DOCs/Year.2008/08.09.Autumn招新@MSTC/面试/09.09 TG 面试需求分析会议/聊天记录.rtf
DOCs/Year.2008/08.09.Autumn招新@MSTC/面试/09.13 俱乐部需求分析（sleepyworm 整理）/MSTC recruitment.doc
DOCs/Year.2008/08.09.Autumn招新@MSTC/面试/09.13 俱乐部需求分析（sleepyworm 整理）/MSTC recruitment.pdf
DOCs/Year.2008/08.09.Autumn招新@MSTC/面试/常用面试话题.txt
DOCs/Year.2008/08.09.Autumn招新@MSTC/面试/招新面试策划.doc
DOCs/Year.2008/08.09.Autumn招新@MSTC/面试/玉泉面试记录.docx
DOCs/Year.2008/08.09.Autumn招新@MSTC/面试/面试常见的37个问题（中英文版）.doc
DOCs/Year.2008/08.Spring招新/08.Spring招新报名.zip
DOCs/Year.2008/08.Spring招新/08.Spring春季招新总结.doc
DOCs/Year.2008/08.Spring招新/2006招新总结.doc
DOCs/Year.2008/08.Spring招新/2008.Spring@MSTC报名表.zip
DOCs/Year.2008/08.Spring招新/2008.Spring@MSTC海报.zip
DOCs/Year.2008/08.Spring招新/2008春季纳新策划.doc
DOCs/Year.2009/09.09.秋学期招新/报名表整理/报名表模板/MSTC_Application_Form.doc
DOCs/Year.2009/09.09.秋学期招新/报名表整理/报名表模板/MSTC_Application_Form_back.doc
DOCs/Year.2009/09.09.秋学期招新/海报/09 纳新海报.psd
DOCs/Year.2009/09.09.秋学期招新/通知模版.txt
DOCs/Year.2009/09.09.秋学期招新/面试（最终版报名表）/2009秋纳新面试安排.xls
DOCs/Year.2009/09.09.秋学期招新/面试（最终版报名表）/2009秋纳新面试安排（面试结果）.xls
DOCs/Year.2009/09.09.秋学期招新/面试（最终版报名表）/面试Log.docx
DOCs/Year.2010/10.03 春学期招新/2010春季纳新总结.docx
DOCs/Year.2010/10.03 春学期招新/报名表/application_form.doc
DOCs/Year.2010/10.03 春学期招新/报名表/application_form.pdf
DOCs/Year.2010/10.03 春学期招新/纳新98贴文字部分.docx
DOCs/Year.2010/10.03 春学期招新/纳新会议记录.docx
DOCs/Year.2010/10.03 春学期招新/纳新时间安排.docx
DOCs/Year.2010/10.03 春学期招新/通知面试短信和邮件内容.txt
DOCs/Year.2010/10.03 春学期招新/通知面试结果的短信和邮件模版.txt
DOCs/Year.2010/10.03 春学期招新/面试记录/10.04.05 纳新面试.html
DOCs/Year.2010/10.09 纳新/2010.08.31 讨论纪要.txt
DOCs/Year.2010/10.09 纳新/2010.09.12 百团大战总结.docx
DOCs/Year.2010/10.09 纳新/2010秋纳新PM总结.docx
DOCs/Year.2010/10.09 纳新/面试安排.xlsx
DOCs/Year.2010/10.09 纳新/面试结果v3.xlsx
DOCs/Year.2010/10.09 纳新/面试记录.docx
DOCs/Year.2011/11.09.18 秋学期纳新/MSTC微软技术俱乐部.ppt
DOCs/Year.2011/11.09.18 秋学期纳新/MSTC报名表.docx
DOCs/Year.2011/11.09.18 秋学期纳新/拒信模板.txt
DOCs/Year.2011/11.09.18 秋学期纳新/面试电子版记录/MSTC 2011 面试周五.docx
DOCs/Year.2011/11.09.18 秋学期纳新/面试电子版记录/MSTC 2011 面试周六上午.docx
DOCs/Year.2011/11.09.18 秋学期纳新/面试电子版记录/MSTC 2011 面试周六下午.docx
