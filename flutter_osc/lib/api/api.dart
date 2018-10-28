class Api {
  static const String HOST = "https://www.oschina.net";

  // 资讯列表
  static const String NEWS_LIST = "http://osc.yubo725.top/news/list";

  // 资讯详情
  static const String NEWS_DETAIL = HOST + "/action/openapi/news_detail";

  // 动弹列表
  static const String TWEETS_LIST = HOST + "/action/openapi/tweet_list";

  // 评论列表
  static const String COMMENT_LIST = HOST + "/action/openapi/comment_list";

  // 评论回复
  static const String COMMENT_REPLY = HOST + "/action/openapi/comment_reply";

  // 获取用户信息
  static const String USER_INFO = HOST + "/action/openapi/user";

  // 发布动弹
  static const String PUB_TWEET = HOST + "/action/openapi/tweet_pub";

  // 添加到小黑屋
  static const String ADD_TO_BLACK = "http://osc.yubo725.top/black/add";

  // 查询小黑屋
  static const String QUERY_BLACK = "http://osc.yubo725.top/black/query";

  // 从小黑屋中删除
  static const String DELETE_BLACK = "http://osc.yubo725.top/black/delete";

  // 开源活动
  static const String EVENT_LIST = "http://osc.yubo725.top/events/";
}