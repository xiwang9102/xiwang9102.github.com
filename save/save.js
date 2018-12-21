function save(body,ok,error) {
      apiToken3=window.atob(apiToken2)
      gistId3=window.atob(gistId2)
    //   console.log('apiToken:',apiToken)
    //   console.log('gistId:',gistId)
      var octo = new Octokat({
      token: apiToken3
	})
	let uid=localStorage.getItem('uid')
	if(uid===null||uid===undefined||uid===''){
	   uid=guid()
	   localStorage.setItem('uid',uid)
	}
	body+=' '+getCurrDate()+','+uid
	// console.log('body:',body)
	body=window.btoa(body)
    octo.gists(gistId3).comments.create({
        "body": body
      })
      .then(() => {
        // Done!
        if(ok)ok()
      }).catch(function (e) {
        if(error)error(e)
      })
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
	let t=new Date().Format("yyyy-MM-dd hh:mm:ss S");
	return t;
}

function guid() {
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
}
