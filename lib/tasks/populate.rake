# coding: utf-8

class ChineseNameGenerator
  FIRST_NAME = ('伟刚勇毅俊峰强军平保东文辉力明永健世广志义兴良海山仁波宁贵福生龙元全国胜学祥才发武新利清飞彬富顺信子杰涛昌成康星光天达安岩中茂进林有坚和彪博诚先敬震振壮会思群豪心邦承乐绍功松善厚庆磊民友裕河哲江超浩亮政谦亨奇固之轮翰朗伯宏言若鸣朋斌梁栋维启克伦翔旭鹏泽晨辰士以建家致树炎德行时泰盛雄琛钧冠策腾楠榕风航弘'
                '秀娟英慧巧美娜静淑惠珠翠雅芝玉萍红娥玲芬芳燕彩春菊兰凤洁梅琳素云莲环雪爱妹霞香月莺媛艳琼珍贞莉桂娣叶璧璐娅琦晶妍茜秋珊莎锦黛青倩婷姣婉娴瑾颖露瑶怡婵雁蓓纨仪丹蓉眉君琴蕊薇菁梦岚苑婕馨瑗琰韵融园艺咏卿澜纯毓悦昭冰琬茗希宁欣飘育滢馥筠柔竹霭凝霄枫芸菲伊宜可姬舒影荔枝思丽').chars.to_a

  LAST_NAME  = ('赵钱孙李周吴郑王' '冯陈褚卫蒋沈韩杨' '朱秦尤许何吕施张' '孔曹严华金魏陶姜' '戚谢邹喻柏水窦章' '云苏潘葛奚范彭郎' '鲁韦昌马苗凤花方' '俞任袁柳酆鲍史唐').chars.to_a

  def self.generate(length = rand(2..3))
    "#{LAST_NAME.sample(1).join}#{FIRST_NAME.sample(length-1).join}"
  end
end

class String
  def sample(x)
    chars.to_a.sample(x).join
  end
end

MAJORS =(<<'EOS'
科学社会主义
世界社会主义运动史
国外马克思主义研究
马克思主义哲学
科学技术哲学
中国哲学
东方哲学史
西方哲学史
现代外国哲学
逻辑学
伦理学
美学
宗教学理论
无神论
原始宗教
古代宗教
佛教
基督宗教
伊斯兰教
道教
印度教
犹太教
神道教
中国民间宗教与民间信仰
中国少数民族宗教
当代宗教
音乐
戏剧
电影
戏曲
舞蹈
广播电视文艺
美术
工艺美术
书法
摄影
史学史
史学理论
历史文献学
中国通史
中国古代史
世界通史
亚洲史
非洲史
美洲史
欧洲史
专门史
考古理论
考古学史
考古技术
中国考古
外国考古
专门考古
政治学理论
政治制度
行政学
国际政治学
理论法学
刑事法学
民法经济法学
国际法学
社会学史
社会学理论
社会学方法
实验社会学
数理社会学
应用社会学
比较社会学
社会地理学
文化社会学
历史社会学
科学社会学
经济社会学
军事社会学
社会心理学
公共关系学
社会人类学
组织社会学
发展社会学
福利社会学
人口学
军事学
民族学文化人类学
民俗学
藏学突厥学蒙古学朝鲜学
民族文物及博物馆学
世界民族研究
民族社会学
民族经济学
民族政治学
新闻理论
新闻史
新闻业务
新闻事业经营管理
广播与电视
传播学
教育史
教育学原理
教学论
德育原理
教育社会学
教育心理学
教育经济学
教育统计学
教育管理学
比较教育学
教育技术学
军事教育学
学前教育学
普通教育学
高等教育学
成人教育学
职业技术教育学
特殊教育学
体育史
体育理论
运动生物力学
运动生理学
运动心理学
运动生物化学
体育保健学
运动训练学
体育教育学
武术理论与方法
体育管理学
体育经济学
数学史
数理逻辑与数学基础
数论
组合数学
非标准分析
拓扑学
代数学
代数几何学
离散数学
几何学
常微分方程
偏微分方程
积分方程
动力系统
数学分析
函数论
泛函分析
计算数学
应用统计数学
数理统计学
概率论
运筹学
模糊数学
应用数学
信息科学与系统科学基础学科
控制理论
系统学
系统工程方法论
系统评估与可行性分析
理论物理学
原子核物理学
高能物理学
计算物理学
电磁学
声学
热学
无线电物理
电子物理学
凝聚态物理学
等离子体物理学
光学
应用物理学
原子分子物理学
物理学史
物理学交叉学科
天文学史
天体演化学
天体生物学
天体力学
天体物理学
天体测量学
射电天文学
空间天文学
天体化学
星系与宇宙学
恒星与银河系
太阳与太阳系
物理化学
化学物理学
高分子化学与物理
化学生物学
有机化学
分析化学
无机化学
核化学
化学史
应用化学
地球科学史
水文学
海洋科学
大地测量学
地图学
固体地球物理学
空间物理学
地球化学
地质学
大气科学
生物进化论
生物数学
生物物理学
病毒学
微生物学
细胞生物学
发育生物学
遗传学
生物工程
生物化学
分子生物学
放射生物学
神经生物学
生理学
动物学
人类学
昆虫学
植物学
生态学
心理学
一般力学与力学基础
固体力学
流体力学
工程数学
工程控制论
工程物理学
计量学
工程图学
工程地质学
工程水文学
勘查技术
工程仿生学
工程心理学
标准化科学技术
工程通用技术
工业工程学
大地测量科学技术
摄影测量与遥感技术
地图制图与地理信息系统技术
工程测量技术
海洋测绘技术
测绘仪器技术
无机非金属材料
有机高分子材料
材料合成与加工工艺
材料表面与界面
复合材料
金属材料
材料科学
材料失效与保护
材料检测与分析技术
材料实验
矿山地质学
矿山测量
矿山设计
矿山地面工程
井巷工程
采矿工程
选矿工程
钻井工程
油气田井开发工程
矿山机械工程
矿山电气工程
采矿环境工程
矿山安全
矿山综合利用工程
冶金物理化学
冶金反应工程
冶金原料与预处理
冶金热能工程
冶金技术
钢铁冶金
有色金属冶金
轧制
冶金机械及自动化
机械史
机械学
机械设计
机械制造工艺与设备
刀具技术
机床技术
仪器仪表技术
流体传动与控制
机械制造自动化
专用机械工程
工程热物理
热工学
电气工程
能源化学
能源地理学
能源计算与测量
储能技术
节能技术
一次能源
二次能源
能源系统工程
辐射物理与技术
核探测技术与核电子学
放射性计量学
核材料与工艺技术
粒子加速器
裂变堆工程技术
核聚变工程技术
核动力工程技术
同位素技术
核爆炸工程
核安全
乏燃料后处理技术
辐射防护技术
核设施退役技术
物理电子学
微电子学与固体电子学
光电子学与激光技术
电路与系统
电磁场与微波技术
广播与电视工程技术
信号与信息处理
通信与信息系统
控制理论与控制工程
系统工程
模式识别与智能系统
检测技术与自动化装置
计算机科学技术基础学科
计算机软件
计算机系统结构
人工智能
信息安全
计算机应用技术
计算机网络技术
计算机工程
化学工程基础学科
化工测量技术与仪器仪表
化工传递过程
化学分离工程
化学反应工程
化工系统工程
化工机械与设备
无机化学工程
有机化学工程
电化学工程
高聚物工程
煤化学工程
石油化学工程
精细化学工程
造纸技术
毛皮与制革工程
制药工程
生物化学工程
纺织材料
化学纤维
纺织技术
染整技术
服装技术
纺织机械与设备
食品工程
食品机械与包装
食品储藏与资源开发
食品工业企业管理学
食品贸易与文化
工程结构
土木建筑结构
建筑史
土木建筑工程基础学科
土木建筑工程测量
土木建筑工程设计
土木建筑工程施工
建筑材料
土木工程机械与设备
市政工程
建筑经济学
水利水电工程
水文学及水资源
水工结构工程
水利学与河流动力学
道路工程
公路运输
铁道工程
铁路运输
水路运输
航空运输
交通运输系统工程
交通运输安全工程
航空器结构与设计
航天器结构与设计
飞行器制造技术
飞行器试验技术
环境科学与技术
环境规划与管理
环境工程
安全科学技术基础学科
安全学
安全工程技术
职业卫生工程
安全管理工程
人体解剖学
人体组织胚胎学
病理学
医学寄生虫学
医学微生物学
人体免疫学
医学生物化学
放射医学
医学细胞生物学
人体生理学
病理生理学
医学遗传学
生物医学工程学
医学实验动物学
医学心理学
医学统计学
麻醉学
耳鼻咽喉科学
口腔医学
眼科学
外科学
妇产科学
毒理学
消毒学
流行病学
职业病学
地方病学
营养学
卫生检验学
食品卫生学
环境卫生学
劳动卫生学
放射卫生学
卫生工程学
卫生经济学
社会医学
儿少卫生学
妇幼卫生学
健康教育学
卫生事业管理学
军事医学
特种医学
药物化学
生物药物学
微生物药物学
放射性药物学
药剂学
药物管理学
中医学
民族医学
中西医结合医学
中药学
农业史
农业基础学科
农艺学
园艺学
土壤学
植物保护学
农业工程
林业基础学科
林木遗传育种学
森林培育学
森林经理学
森林保护学
野生动物保护与管理
防护林学
经济林学
园林学
林业工程
森林统计学
林业经济学
临床兽医学
基础兽医学
预防兽医学
动物遗传
繁育学
动物生产学
动物营养学
水产学基础学科
水产增殖学
水产养殖学
水产饲料学
水产保护学
捕捞学
水产品贮藏与加工
水产工程学
水产资源学
水产经济学
管理思想史
管理理论
部门经济管理
管理心理学
未来学
科学学与科技管理
企业管理
行政管理
管理工程
人力资源开发与管理
公共管理学
世界经济学
技术经济学
产业经济学
数量经济学
宏观经济学
微观经济学
财政学
会计学
审计学
金融管理
货币银行学
保险学
劳动经济学
农业经济学
生态经济学
资源经济学
环境经济学
城市经济学
旅游经济学
政治经济学
比较经济学
经济地理学
发展经济学
经济思想史
经济史
国民经济学
管理经济学
物资经济学
交通运输经济学
市场营销学
价格学
信息经济学
国防经济学
图书馆学
文献学
情报学
档案学
信息资源管理
图书出版发行管理
统计学史
理论统计学
统计法学
经济统计学
科学技术统计学
社会统计学
人口统计学
环境与生态统计学
国际统计学
EOS
).lines.map(&:chomp)

namespace :db do
  task :populate => :environment do
    30.times do |i|
      puts i
      Form.create! name: ChineseNameGenerator.generate,
                   tel: ('1' + (('0'..'9').to_a.join * 6).sample(10)),
                   major: MAJORS.sample,
                   gender: rand(1..2),
                   email: "#{(('a'..'z').to_a.join * 8).sample(5)}@theearth.org",
                   campus: 1,
                   groups: [:tg,:cg,:og,:pg].sample(rand(1..2)),
                   q1: '这',
                   q2: '家伙',
                   q3: '很',
                   q4: '懒'
    end
  end
end
