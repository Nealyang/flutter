class Api{
  // 小册
  static const String XIAOCE = 'https://xiaoce-timeline-api-ms.juejin.im/v1/getListByLastTime';//?uid=&client_id=&token=&src=web&pageNum=1
  static const String BANNER_STORAGE = 'https://banner-storage-ms.juejin.im/v1/web/page/aanner?position=hero&platform=web&page=0&pageSize=20&src=web';
  // 首页list
  static const String RANK_LIST = 'https://timeline-merger-ms.juejin.im/v1/get_entry_by_rank';

  // 沸点
//   uid: 
// device_id: 
// token: 
// src: web
// before: 2018-11-02T16:46:17.731Z
// limit: 30
  static  const PinsListRecommend = 'https://short-msg-ms.juejin.im/v1/pinList/recommend?uid=&device_id=&token=&src=web&before=2018-11-02T16%3A46%3A17.731Z&limit=30';

  // static  const PinsListSubscribed = 'https://short-msg-ms.juejin.im/v1/pinList/dynamic?uid=59be059c5188256c6d77cf2e&device_id=1541234434900&token=eyJhY2Nlc3NfdG9rZW4iOiJPb21uZGIySHJVQXU4b2pnIiwicmVmcmVzaF90b2tlbiI6IlJDdFNCVVIzaWw0Vmx0VGoiLCJ0b2tlbl90eXBlIjoibWFjIiwiZXhwaXJlX2luIjoyNTkyMDAwfQ%3D%3D&src=web&before&limit=30';
//   uid: 59be059c5188256c6d77cf2e
// device_id: 1541234434900
// token: eyJhY2Nlc3NfdG9rZW4iOiJPb21uZGIySHJVQXU4b2pnIiwicmVmcmVzaF90b2tlbiI6IlJDdFNCVVIzaWw0Vmx0VGoiLCJ0b2tlbl90eXBlIjoibWFjIiwiZXhwaXJlX2luIjoyNTkyMDAwfQ==
// src: web
// before: 
// limit: 30
  static const PinsListSubscribed = 'https://short-msg-ms.juejin.im/v1/pinList/dynamic?uid=59be059c5188256c6d77cf2e&device_id=1541234434900&token=eyJhY2Nlc3NfdG9rZW4iOiJPb21uZGIySHJVQXU4b2pnIiwicmVmcmVzaF90b2tlbiI6IlJDdFNCVVIzaWw0Vmx0VGoiLCJ0b2tlbl90eXBlIjoibWFjIiwiZXhwaXJlX2luIjoyNTkyMDAwfQ%3D%3D&src=web&before&limit=30';
}