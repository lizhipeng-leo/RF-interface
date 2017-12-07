*** Settings ***
Resource          ../资源/ResourceCommon.tsv

*** Test Cases ***
线路查询
    [Documentation]    描述：验证核心系统资源->交通->查询线路列表接口
    ...
    ...    author：李志鹏
    #发送get请求（线路列表查看）
    SendGet_Recv200    /transport/line

添加线路
    [Documentation]    描述：验证核心系统资源->交通->添加线路接口
    ...
    ...    author：李志鹏
    #获取一个随机的账号作为线路名
    ${randomstring}    Generate Random String    6    [LOWER][UPPER]
    Set Suite Variable    ${randomstring}    ${randomstring}
    Set Suite Variable    ${line_name}    接口测试创建${randomstring}
    #查询目的地（发送post请求）
    ${distResponse}    SendPost_Recv200    application/json;charset=UTF-8    {"name":"","pageIndex":1,"pageSize":10}    /distribution/product/dest/select
    #校验请求是否成功
    Json Value Should Equal    ${distResponse}    /code    0
    #获取目的地名称
    ${distName1}    Get Json Value    ${distResponse}    /data/0/name
    ${distName2}    Get Json Value    ${distResponse}    /data/1/name
    Set Global Variable    ${distName1}    ${distName1}
    Set Global Variable    ${distName2}    ${distName2}
    #添加线路
    ${lineResponse}    SendPost_Recv200    application/json;charset=UTF-8    { \ \ \ \ "name": "${line_name}", \ \ \ \ "lineNodeForms": [ \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \ \ "id": 0, \ \ \ \ \ \ \ \ \ \ \ \ "type": "DEPARTURE", \ \ \ \ \ \ \ \ \ \ \ \ "name": ${distName1}, \ \ \ \ \ \ \ \ \ \ \ \ "describe": "节点描述", \ \ \ \ \ \ \ \ \ \ \ \ "arriveTime": 21600, \ \ \ \ \ \ \ \ \ \ \ \ "departTime": 21600, \ \ \ \ \ \ \ \ \ \ \ \ "departDay": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "当" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "departHour": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 6, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": 6 \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "departMinute": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": 0 \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveDay": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "当" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveHour": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": 0 \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveMinute": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": 0 \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "index": 0 \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \ \ "id": 0, \ \ \ \ \ \ \ \ \ \ \ \ "type": "PATH", \ \ \ \ \ \ \ \ \ \ \ \ "name": ${distName2}, \ \ \ \ \ \ \ \ \ \ \ \ "describe": "节点描述", \ \ \ \ \ \ \ \ \ \ \ \ "arriveTime": 25200, \ \ \ \ \ \ \ \ \ \ \ \ "departTime": 28800, \ \ \ \ \ \ \ \ \ \ \ \ "departDay": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "当" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "departHour": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 8, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": 8 \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "departMinute": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": 0 \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveDay": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "当" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveHour": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 7, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": 7 \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveMinute": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": 0 \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "index": 1 \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \ \ "id": 0, \ \ \ \ \ \ \ \ \ \ \ \ "type": "ARRIVAL", \ \ \ \ \ \ \ \ \ \ \ \ "name": ${distName1}, \ \ \ \ \ \ \ \ \ \ \ \ "describe": "节点描述", \ \ \ \ \ \ \ \ \ \ \ \ "arriveTime": 32400, \ \ \ \ \ \ \ \ \ \ \ \ "departTime": 32400, \ \ \ \ \ \ \ \ \ \ \ \ "departDay": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "当" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "departHour": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": 0 \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "departMinute": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": 0 \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveDay": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "当" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveHour": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 9, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": 9 \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveMinute": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": 0 \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "index": 2 \ \ \ \ \ \ \ \ } \ \ \ \ ], \ \ \ \ "credentialRequirement": [ \ \ \ \ \ \ \ \ "ID", \ \ \ \ \ \ \ \ "TW_TRAVEL_PERMIT", \ \ \ \ \ \ \ \ "HKM_TRAVEL_PERMIT", \ \ \ \ \ \ \ \ "PASSPORT", \ \ \ \ \ \ \ \ "STUDENT_ID", \ \ \ \ \ \ \ \ "SOLDIER_ID", \ \ \ \ \ \ \ \ "DRIVER_ID", \ \ \ \ \ \ \ \ "HONGKONG_MACAU_PASSPORT", \ \ \ \ \ \ \ \ "SEAFARER_ID", \ \ \ \ \ \ \ \ "FOREIGNER_PERMANENT_RESIDENCE_ID", \ \ \ \ \ \ \ \ "TW_PASSPORT", \ \ \ \ \ \ \ \ "OTHER" \ \ \ \ ] }    /transport/line/add
    #校验请求是否成功
    Json Value Should Equal    ${lineResponse}    /code    0
    #####添加线路通过审核
    #首先查询线路审核id
    ${lineAppID}    SelectFromPsycopg    SELECT "id" FROM "corp"."line_application" WHERE "name"='${line_name}' ORDER BY "id" DESC;
    #获得当前时间，精确到天
    ${year}    ${month}    ${day}    Get Time    year,month,day
    ${time1}    Set Variable    ${year}-${month}-${day}
    Set Global Variable    ${time1}    ${time1}
    #获取当前时间，精确到分钟
    @{b}    Get Time    hour min    NOW
    ${time2}    Set Variable    @{b}[0]:@{b}[1]
    Set Global Variable    ${time2}    ${time2}
    ${lineAppResponse}    SendPost_Recv200    application/json;charset=UTF-8    \    /transport/line/application/accept/${lineAppID}/${time1}%20${time2}/true
    Json Value Should Equal    ${lineAppResponse}    /code    0

线路搜索
    [Documentation]    描述：验证核心系统资源->交通->线路搜索接口
    ...
    ...    author：李志鹏
    #发送get请求
    ${responsedata}    SendGet_Recv200    /transport/line/list?id=&name=&cycle=&destinations=

查看线路
    [Documentation]    描述：验证核心系统资源->交通->查看线路内容接口
    ...
    ...    author：李志鹏
    #查询线路id
    ${line_ID}    SelectFromPsycopg    SELECT "id" FROM "corp"."line" WHERE "name"='${line_name}';
    Set Global Variable    ${line_ID}    ${line_ID}
    #发送get请求（线路查看页面）
    SendGet_Recv200    /transport/line/view/${line_ID}

更新线路
    [Documentation]    描述：验证核心系统资源->交通->更新线路信息接口
    ...
    ...    author：李志鹏
    [Template]
    #查询version值
    ${versionID}    SelectFromPsycopg    SELECT "version" FROM "corp"."line" WHERE "id"='${line_ID}';
    Set Suite Variable    ${versionID}    ${versionID}
    #查询节点id
    ${line_Node_1}    SelectFromPsycopg    SELECT * FROM "corp"."node" WHERE line_id=${line_ID} AND "type"='DEPARTURE';
    ${line_Node_2}    SelectFromPsycopg    SELECT * FROM "corp"."node" WHERE line_id=${line_ID} AND "type"='PATH';
    ${line_Node_3}    SelectFromPsycopg    SELECT * FROM "corp"."node" WHERE line_id=${line_ID} AND "type"='ARRIVAL';
    #发送post请求（更新线路信息）
    ${responsedata}    SendPost_Recv200    application/json;charset=UTF-8    { \ \ \ \ "id": ${line_ID}, \ \ \ \ "version": ${versionID}, \ \ \ \ "name": "${line_name}", \ \ \ \ "nodeForms": [ \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \ \ "id": ${line_Node_1}, \ \ \ \ \ \ \ \ \ \ \ \ "type": "DEPARTURE", \ \ \ \ \ \ \ \ \ \ \ \ "name": ${distName1}, \ \ \ \ \ \ \ \ \ \ \ \ "describe": "节点描述", \ \ \ \ \ \ \ \ \ \ \ \ "departTime": 21600, \ \ \ \ \ \ \ \ \ \ \ \ "arriveTime": 0, \ \ \ \ \ \ \ \ \ \ \ \ "index": 0, \ \ \ \ \ \ \ \ \ \ \ \ "departDay": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "当" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "departHour": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 6, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "6" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "departMinute": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "0" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveDay": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "当" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveHour": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 6, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "6" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveMinute": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "0" \ \ \ \ \ \ \ \ \ \ \ \ } \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \ \ "id": ${line_Node_2}, \ \ \ \ \ \ \ \ \ \ \ \ "type": "PATH", \ \ \ \ \ \ \ \ \ \ \ \ "name": ${distName2}, \ \ \ \ \ \ \ \ \ \ \ \ "describe": "节点描述", \ \ \ \ \ \ \ \ \ \ \ \ "departTime": 28800, \ \ \ \ \ \ \ \ \ \ \ \ "arriveTime": 25200, \ \ \ \ \ \ \ \ \ \ \ \ "index": 1, \ \ \ \ \ \ \ \ \ \ \ \ "departDay": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "当" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "departHour": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 8, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "8" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "departMinute": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "0" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveDay": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "当" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveHour": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 7, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "7" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveMinute": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "0" \ \ \ \ \ \ \ \ \ \ \ \ } \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \ \ "id": ${line_Node_3}, \ \ \ \ \ \ \ \ \ \ \ \ "type": "ARRIVAL", \ \ \ \ \ \ \ \ \ \ \ \ "name": ${distName1}, \ \ \ \ \ \ \ \ \ \ \ \ "describe": "节点描述", \ \ \ \ \ \ \ \ \ \ \ \ "departTime": 32400, \ \ \ \ \ \ \ \ \ \ \ \ "arriveTime": 32400, \ \ \ \ \ \ \ \ \ \ \ \ "index": 2, \ \ \ \ \ \ \ \ \ \ \ \ "departDay": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "当" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "departHour": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 9, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "9" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "departMinute": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "0" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveDay": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "当" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveHour": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 9, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "9" \ \ \ \ \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ \ \ \ \ "arriveMinute": { \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "value": 0, \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ "text": "0" \ \ \ \ \ \ \ \ \ \ \ \ } \ \ \ \ \ \ \ \ } \ \ \ \ ], \ \ \ \ "credentialRequirement": [ \ \ \ \ \ \ \ \ "ID", \ \ \ \ \ \ \ \ "TW_TRAVEL_PERMIT", \ \ \ \ \ \ \ \ "HKM_TRAVEL_PERMIT", \ \ \ \ \ \ \ \ "PASSPORT", \ \ \ \ \ \ \ \ "STUDENT_ID", \ \ \ \ \ \ \ \ "SOLDIER_ID", \ \ \ \ \ \ \ \ "DRIVER_ID", \ \ \ \ \ \ \ \ "HONGKONG_MACAU_PASSPORT", \ \ \ \ \ \ \ \ "SEAFARER_ID", \ \ \ \ \ \ \ \ "FOREIGNER_PERMANENT_RESIDENCE_ID", \ \ \ \ \ \ \ \ "TW_PASSPORT", \ \ \ \ \ \ \ \ "OTHER" \ \ \ \ ] }    /transport/line/edit
    #验证是否更新成功（成功为0，失败为1）
    Json Value Should Equal    ${responsedata}    /code    0
    Comment    #####添加线路通过审核
    Comment    #首先查询线路审核id
    Comment    ${lineAppID}    SelectFromPsycopg    SELECT "id" FROM "corp"."line_application" WHERE "name"='${line_name}' ORDER BY "id" DESC;
    Comment    #获得当前时间，精确到天
    Comment    ${year}    ${month}    ${day}    Get Time    year,month,day
    Comment    ${time1}    Set Variable    ${year}-${month}-${day}
    Comment    Set Global Variable    ${time1}    ${time1}
    Comment    #获取当前时间，精确到分钟
    Comment    @{b}    Get Time    hour min    NOW
    Comment    ${time2}    Set Variable    @{b}[0]:@{b}[1]
    Comment    Set Global Variable    ${time2}    ${time2}
    Comment    ${lineAppResponse}    SendPost_Recv200    application/json;charset=UTF-8    \    /transport/line/application/accept/${lineAppID}/${time1}%20${time2}/true
    Comment    Json Value Should Equal    ${lineAppResponse}    /code    0

线路-库存查看
    SendGet_Recv200    /transport/line/stock/list/${line_id}

添加库存
    #获取用例执行当天时间，格式yyyy-mm-dd
    ${time}    Get Time
    #Split String 第一个参数：待处理字符串 \ 第二个参数：分隔符
    ${YMD}    Split String    ${time}    ${SPACE}
    log    ${YMD[0]}
    #声明变量，
    Set Global Variable    ${DayStock}    ${YMD[0]}
    ${resp}    SendPost_Recv200    application/json;charset=UTF-8    {"lineId":${line_id},"dates":{"startTime":"${YMD[0]}","endTime":"${YMD[0]}","type":2,"cycle":"1","weeks":[{"value":"MON","remark":"星期一","checked":true},{"value":"TUE","remark":"星期二","checked":true},{"value":"WED","remark":"星期三","checked":true},{"value":"THU","remark":"星期四","checked":true},{"value":"FRI","remark":"星期五","checked":true},{"value":"SAT","remark":"星期六","checked":true},{"value":"SUN","remark":"星期天","checked":true}]},"quantity":"99"}    /transport/line/stock/edit/batch
    Json Value Should Equal    ${resp}    /code    0

查询库存
    ${resp}    SendPost_Recv200    application/json;charset=UTF-8    {"lineId":${line_id},"start":"${DayStock}","end":"${DayStock}"}    /transport/line/stock/list
    Json Value Should Equal    ${resp}    /code    0

批量更新库存
    ${resp}    SendPost_Recv200    application/json;charset=UTF-8    {"lineId":${line_id},"dates":{"startTime":"${DayStock}","endTime":"${DayStock}","type":2,"cycle":"1","weeks":[{"value":"MON","remark":"星期一","checked":true},{"value":"TUE","remark":"星期二","checked":true},{"value":"WED","remark":"星期三","checked":true},{"value":"THU","remark":"星期四","checked":true},{"value":"FRI","remark":"星期五","checked":true},{"value":"SAT","remark":"星期六","checked":true},{"value":"SUN","remark":"星期天","checked":true}]},"quantity":"996"}    /transport/line/stock/edit/batch
    Json Value Should Equal    ${resp}    /code    0

删除库存
    ${responsedata}    SendPost_Recv200    application/json;charset=UTF-8    {"lineId":${line_id},"dates":{"startTime":"${DayStock}","endTime":"${DayStock}","type":2,"cycle":"1","weeks":[{"value":"MON","remark":"星期一","checked":true},{"value":"TUE","remark":"星期二","checked":true},{"value":"WED","remark":"星期三","checked":true},{"value":"THU","remark":"星期四","checked":true},{"value":"FRI","remark":"星期五","checked":true},{"value":"SAT","remark":"星期六","checked":true},{"value":"SUN","remark":"星期天","checked":true}]},"quantity":""}    /transport/line/stock/delete/batch
    Json Value Should Equal    ${responsedata}    /code    0

线路下翻页
    [Documentation]    描述：验证核心系统资源->交通->下一页翻页接口
    ...
    ...    author：李志鹏
    #发送get请求（翻看前十页）
    : FOR    ${i}    IN RANGE    1    11
    \    SendGet_Recv200    /transport/line/list?index=${i}&size=10

线路前翻页
    [Documentation]    描述：验证核心系统资源->交通->最后十页翻页接口
    ...
    ...    author：李志鹏
    #发送get请求（翻看后十页）
    : FOR    ${i}    IN RANGE    10    20
    \    SendGet_Recv200    /transport/line/list?index=${i}&size=10

线路-区段列表查询
    #发送get请求（区段列表查看）
    SendGet_Recv200    /transport/section/line/${line_id}/list

线路-区段添加
    #获取一个随机的账号作为线路名
    ${randomstring}    Generate Random String    6    [LOWER][UPPER]
    Set Suite Variable    ${randomstring}    ${randomstring}
    Set Suite Variable    ${section_name}    接口测试创建${randomstring}
    #查询出routeID
    ${routeID}    SelectFromPsycopg    SELECT "id" FROM "corp"."route" WHERE line_id=${line_ID};
    #发送post请求
    ${responsedata}    SendPost_Recv200    application/json;charset=UTF-8    {"lineId":${line_id},"name":"${section_name}","promotion":0,"originId":null,"operationLine":"重庆-大足线","operationLineId":"23","resourceOwner":"公司","resourceOwnerId":"1","boardingAddress":"四川省成都市青羊区人民南路1段-86号","dropOffAddress":"四川省成都市青羊区半边桥南街42号","boardingLocation":{"x":104.071337,"y":30.662171},"dropOffLocation":{"x":104.066306,"y":30.662171},"routes":[${routeID},${routeID}],"deadline":{"day":0,"hour":0,"minute":0},"refundRuleForms":[{"day":"2","hour":0,"ratio":"100"},{"day":"1","hour":0,"ratio":"60"}],"refundMode":"NONE"}    /transport/section/add
    #验证是否添加成功（成功为0，失败为1）
    Json Value Should Equal    ${responsedata}    /code    0
    #获取即将审核通过的审核列表id
    ${section_applicationID}    SelectFromPsycopg    SELECT id FROM "corp"."section_price_application" WHERE "name"='${section_name}' order by id DESC;
    #对线路添加审核通过
    ${responsedata}    SendPost_Recv200    application/json;charset=UTF-8    \    /transport/section/application/accept/${section_applicationID}/${time1}%20${time2}/true
    #验证是否添加成功（成功为0，失败为1）
    Json Value Should Equal    ${responsedata}    /code    0
    #获取新增的区#an段id
    ${LineSection_id}    SelectFromPsycopg    SELECT id FROM "corp"."section" WHERE "name"='${section_name}';
    Set Global Variable    ${LineSection_id}    ${LineSection_id}
    #######区段变更审核价格变动查看
    SendGet_Recv200    /transport/section/application/price/${section_applicationID}/true

线路-区段搜索
    #区段搜索
    SendGet_Recv200    /transport/section/line/${line_ID}/list?id=&name=&depart=&arrive=&soldOut=

线路-区段查看
    #发送get请求（区段查看页面）
    SendGet_Recv200    /transport/line/view/${line_id}

线路-区段-价格查看
    SendGet_Recv200    /transport/section/price/list/${LineSection_id}

线路-区段-价格搜索
    ${resp}    SendPost_Recv200    application/json;charset=UTF-8    {"sectionId":${LineSection_id},"startTime":"${DayStock}","endTime":"${DayStock}"}    /transport/section/price/list
    Json Value Should Equal    ${resp}    /code    0

线路-区段-价格更新提交审核
    ####先添加库存
    ${resp}    SendPost_Recv200    application/json;charset=UTF-8    {"lineId":${line_id},"dates":{"startTime":"${DayStock}","endTime":"${DayStock}","type":2,"cycle":"1","weeks":[{"value":"MON","remark":"星期一","checked":true},{"value":"TUE","remark":"星期二","checked":true},{"value":"WED","remark":"星期三","checked":true},{"value":"THU","remark":"星期四","checked":true},{"value":"FRI","remark":"星期五","checked":true},{"value":"SAT","remark":"星期六","checked":true},{"value":"SUN","remark":"星期天","checked":true}]},"quantity":"99"}    /transport/line/stock/edit/batch
    Json Value Should Equal    ${resp}    /code    0
    #发送post请求提交价格更新审核
    ${resp}    SendPost_Recv200    application/json;charset=UTF-8    { \ \ \ \ "sectionId": ${LineSection_id}, \ \ \ \ "priceEditForms": [ \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \ \ "day": "${DayStock}", \ \ \ \ \ \ \ \ \ \ \ \ "settlePrice": "100.00", \ \ \ \ \ \ \ \ \ \ \ \ "salesPrice": "100.00", \ \ \ \ \ \ \ \ \ \ \ \ "cost": "100.00", \ \ \ \ \ \ \ \ \ \ \ \ "distShowStr": "0.00% / 100.00", \ \ \ \ \ \ \ \ \ \ \ \ "selfSelected": true, \ \ \ \ \ \ \ \ \ \ \ \ "tmallSelected": true, \ \ \ \ \ \ \ \ \ \ \ \ "otaSelected": true, \ \ \ \ \ \ \ \ \ \ \ \ "distSelected": true, \ \ \ \ \ \ \ \ \ \ \ \ "selfOnline": "true", \ \ \ \ \ \ \ \ \ \ \ \ "tmallOnline": "true", \ \ \ \ \ \ \ \ \ \ \ \ "otaOnline": "true", \ \ \ \ \ \ \ \ \ \ \ \ "distOnline": "true", \ \ \ \ \ \ \ \ \ \ \ \ "otaShowStr": "10.00% / 90.00", \ \ \ \ \ \ \ \ \ \ \ \ "tmallShowStr": "8.00% / 92.00", \ \ \ \ \ \ \ \ \ \ \ \ "selfShowStr": "8.00% / 92.00" \ \ \ \ \ \ \ \ } \ \ \ \ ] }    /transport/section/price/edit
    Json Value Should Equal    ${resp}    /code    0

线路-区段下线
    ####查询出有资源编码的区段
    ${Sid}    SelectFromPsycopg    SELECT * FROM "corp"."section" WHERE company_id=20000 AND code is NOT NULL ORDER BY "id" DESC LIMIT 1;
    Set Global Variable    ${Sid}    ${Sid}
    #####查询出对应区段的线路
    ${versionID}    SelectFromPsycopg    SELECT "version" FROM "corp"."section" WHERE "id"=${Sid};
    #区段下线
    ${resp}    SendPost_Recv200    application/json;charset=UTF-8    \    /transport/section/offline/${Sid}/${versionID}
    Json Value Should Equal    ${resp}    /code    0

线路-区段上线
    #####查询出对应区段的线路
    ${versionID}    SelectFromPsycopg    SELECT "version" FROM "corp"."section" WHERE "id"=${Sid};
    ${resp}    SendPost_Recv200    application/json;charset=UTF-8    \    /transport/section/offline/${Sid}/${versionID}
    Json Value Should Equal    ${resp}    /code    0

线路-区段页10条/页显示
    : FOR    ${i}    IN RANGE    0    4
    \    SendGet_Recv200    /transport/section/line/${line_ID}/list?pageIndex=${i}&lineId=${line_ID}&pageSize=10

线路-区段页50条/页显示
    : FOR    ${i}    IN RANGE    0    4
    \    SendGet_Recv200    /transport/section/line/${line_ID}/list?pageIndex=${i}&lineId=${line_ID}&pageSize=50

车辆调度查看
    #发送get请求
    SendGet_Recv200    /transport/line/${line_ID}/schedule/list

获取排车信息
    #获取排车信息
    ${response}    SendPost_Recv200    application/json;charset=UTF-8    \    /transport/line/${line_ID}/schedule/detail/${time1}
    Json Value Should Equal    ${response}    /code    0
    #获取车牌号信息
    ${busesName}    Get Json Value    ${response}    /data/buses/0/name
    Set Global Variable    ${busesName}    ${busesName}
    #获取车牌号id
    ${busesID}    Get Json Value    ${response}    /data/buses/0/id
    Set Global Variable    ${busesID}    ${busesID}
    #获取助理名字
    ${assistantsName}    Get Json Value    ${response}    /data/assistants/0/name
    Set Global Variable    ${assistantsName}    ${assistantsName}
    #获取助理id
    ${assistantsID}    Get Json Value    ${response}    /data/assistants/0/id
    Set Global Variable    ${assistantsID}    ${assistantsID}
    #获取车辆默认助理位置
    ${busesSeat}    Get Json Value    ${response}    /data/buses/0/defaultAssistantSeat
    Set Global Variable    ${busesSeat}    ${busesSeat}

车辆排车
    #发送post请求
    ${respon}    SendPost_Recv200    application/json;charset=UTF-8    { \ \ \ \ "lineId": ${line_ID}, \ \ \ \ "day": "${time1}", \ \ \ \ "schedules": [ \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \ \ "license": ${busesName}, \ \ \ \ \ \ \ \ \ \ \ \ "osp": "此字段为供应商名称", \ \ \ \ \ \ \ \ \ \ \ \ "assistantName": ${assistantsName}, \ \ \ \ \ \ \ \ \ \ \ \ "assistantSeat": ${busesSeat}, \ \ \ \ \ \ \ \ \ \ \ \ "isDel": false, \ \ \ \ \ \ \ \ \ \ \ \ "busId": ${busesID}, \ \ \ \ \ \ \ \ \ \ \ \ "assistantId": ${assistantsID} \ \ \ \ \ \ \ \ } \ \ \ \ ] }    /transport/line/schedule/edit
    Json Value Should Equal    ${respon}    /code    0

车辆分配
    [Documentation]    描述：验证核心系统资源->交通->车辆分配
    ...
    ...    author：李志鹏
    ${resp}    SendPost_Recv200    application/json;charset=UTF-8    \    /transport/line/schedule/allocate/${line_ID}/${time1}
    Json Value Should Equal    ${resp}    /code    0
