from .settings import MEDIA_URL

# IMG_SAVED_DIR = "/static/media/"
IMG_SAVED_DIR = MEDIA_URL


CATEGORY = ['论坛','通知','购物','交友','失物招领','工作','全部']

SUBCATEGORY = [["本科生","研究生","博士生", "全部"],
            ["校内通知","院系通知","社团活动","全部"],
            ["卖物","求购","全部"],
            ["男生","女生","全部"],
            ["重要证件","较大价值","普通物件","全部"],
            ["全职","兼职","全部"],
            ["全部"]]

ALL_CATEGORY = '全部'

SCHOOL_NOTIFICATIONS = "校内通知"

SEARCH_PAGE_LENGTH = 10

DELTATIME = 3

GENDER = ['其他', '男', '女']

# 0 ---- JLU
# 1 ---- 东北师大
# 2 ---- 长春理工大学
UNIVERSITY_MAILS = [['吉林大学', 'mails.jlu.edu.cn', 'jlu.edu.cn'],
                    ['东北师大', 'nenu.edu.cn', 'mails.nenu.edu.cn'],
                    ['长春理工大学', 'mails.cust.edu.cn', 'cust.edu.cn']]

HOT_LEVEL = 5

DEFAULT_UNIVERSITY = '吉林大学'

def TO_HTML(c):
	return c