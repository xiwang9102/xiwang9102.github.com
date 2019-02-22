function saveLog(url) {
  let baseUrl=url
	let uid=localStorage.getItem('uid')
	if(uid===null||uid===undefined||uid===''){
	   uid=guid()
	   localStorage.setItem('uid',uid)
  }
  var p=window.location.href 
  var browserInfo=getBrowserType()
  p+=','+getCurrDate()+","+browserInfo+","+uid
  var url=baseUrl+decodeURIComponent(p)
  console.log(url)
  var xhttp = new XMLHttpRequest();
  xhttp.open("GET", url, true);
  xhttp.send();
  }

  
  function logging() {
    var baseUrl="https://arcane-river-13026.herokuapp.com/2.js?"
    // var baseUrl="http://localhost:3000/2.js?"
    saveLog(baseUrl)
  }
	

Date.prototype.Format = function(fmt)   
{    
  var o = {   
    "M+" : this.getMonth()+1,                 //月份   
    "d+" : this.getDate(),                    //日   
    "h+" : this.getHours(),                   //小时   
    "m+" : this.getMinutes(),                 //分   
    "s+" : this.getSeconds(),                 //秒   
    "q+" : Math.floor((this.getMonth()+3)/3), //季度   
    "S"  : this.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
} 

function getCurrDate() {
  let d=new Date()
  let ymd=d.Format("yyyy-MM-dd");
  let hms=d.Format("hh:mm:ss");
  let S=d.Format("S");
	return ymd+","+hms+","+S;
}

function guid() {
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
}

function getBrowserType() {
  var browser = {
      versions: function () {
          var u = navigator.userAgent,
              app = navigator.appVersion;
          return { //移动终端浏览器版本信息
              ie: u.indexOf('Trident') > -1, //IE内核
              opera: u.indexOf('Presto') > -1, //opera内核
              webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
              firefox: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
              mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
              ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
              android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或uc浏览器
              iPhone: u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器
              iPad: u.indexOf('iPad') > -1, //是否iPad
              webApp: u.indexOf('Safari') == -1 //是否web应用程序，没有头部与底部
          };
      }(),
      language: (navigator.browserLanguage || navigator.language).toLowerCase()
  }
  if (browser.versions.mobile) { //判断是否是移动设备打开。browser代码在下面
      var ua = navigator.userAgent.toLowerCase(); //获取判断用的对象
      if (ua.match(/MicroMessenger/i) == "micromessenger") {
          //在微信中打开
          browser.versions.weixin = true
      }
  }
  let result = ''
  for (let key in browser.versions) {
      let v = browser.versions[key]
      if (v)result+=key+','
  }
  if(result.indexOf(',')!=-1){
      result=result.substring(0,result.length-1)
  }
  return result
}

logging()