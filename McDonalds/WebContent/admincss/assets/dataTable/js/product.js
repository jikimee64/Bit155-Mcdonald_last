/*  // 표시 건수기능 숨기기
		 lengthChange: true,
		 // 검색 기능 숨기기
		 searching: false,
		 // 정렬 기능 숨기기
		 ordering: false,
		 // 정보 표시 숨기기
		 info: false,
		 // 페이징 기능 숨기기
		 paging: true,
		 // pagingType: scrolling */

         $(document).ready(function () {

            /*  $.fn.dataTable.ext.search.push(
                  function(settings, data, dataIndex){
                      var min = Date.parse($('#fromDate').val());
                      var max = Date.parse($('#toDate').val());
                      var targetDate = Date.parse(data[3]);
          
                      if( (isNaN(min) && isNaN(max) ) || 
                          (isNaN(min) && targetDate <= max )|| 
                          ( min <= targetDate && isNaN(max) ) ||
                          ( targetDate >= min && targetDate <= max) ){ 
                              return true;
                      }
                      return false;
                  }
              )*/
          
              var table = $('#myTable').DataTable({
                  /*ajax: {
                      'url':'MOCK_DATA.json', 
                      //'type': 'POST',
                      'dataSrc':''
                  },*/
                  responsive: true,
                  orderMulti: true,
                  order : [[1, 'desc']],
                  
          //        columns: [
          //            {"data": "id"},
          //            {"data": "first_name"},
          //            {"data": "last_name"}, 
          //            {"data": "email"}, 
          //            {"data": "gender"}, 
          //            {"data": "date"},
          //            {"data": "ip_address",
          //                "render": function(data, type, row){
          //                    /*
          //                     * 다른 column의 값을 다루고 싶을 땐
          //                     * row['COLUMN명'] 으로 꺼내쓸 수 있다.
          //                     */
          //                    if(type=='display'){
          //                        data = '<a href="'+ data + '">' + data + '</a>';
          //                    }
          //                    return data;
          //            }},
          //            {"data":"money"}
          //        ],
                  "language": {
                      "emptyTable": "데이터가 없어요.",
                      "lengthMenu": "페이지당 _MENU_ 개씩 보기",
                      "info": "현재 _START_ - _END_ / _TOTAL_건",
                      "infoEmpty": "데이터 없음",
                      "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
                      "search": "에서 검색: ",
                      "zeroRecords": "일치하는 데이터가 없어요.",
                      "loadingRecords": "로딩중...",
                      "processing":     "잠시만 기다려 주세요...",
                      "paginate": {
                          "next": "다음",
                          "previous": "이전"
                      }
                  },
                  "pageLength": 10,
                  "lengthMenu": [[3, 5, 10, -1], [3, 5, 10, "All"]],
                  dom : 'Blfrtip',
                  buttons:[{
                      extend:'csvHtml5',
                      text: 'Export CSV',
                      footer: true,
                      bom: true,
                      className: 'exportCSV'
                  },
                  {extend:'csvHtml5',
                      text: '상품 등록하기',
                      footer: true,
                      bom: true,
                      className: 'empAdd',
                      action: function (e, dt, node, config)
                      {
                                  //This will send the page to the location specified
                            window.location.href = 'ProductRegisterPage.p';
                      }
                  }
                  ]
              });
          
              /* Column별 검색기능 추가 */
              $('#myTable_filter').prepend('<select id="select"></select>');
              $('#myTable > thead > tr').children().each(function (indexInArray, valueOfElement) { 
                  if(valueOfElement.innerHTML != '상품사진'){
                      $('#select').append('<option class=visibility:hidden;>'+valueOfElement.innerHTML+'</option>');
                  }
              });
              
              
              $('.dataTables_filter input').unbind().bind('keyup', function () {
                  var colIndex = document.querySelector('#select').selectedIndex;
                  table.column(colIndex+1).search(this.value).draw();
              });
          
              /* 날짜검색 이벤트 리바인딩 */
              /*$('#myTable_filter').prepend('<input type="text" id="toDate" placeholder="yyyy-MM-dd"> ');
              $('#myTable_filter').prepend('<input type="text" id="fromDate" placeholder="yyyy-MM-dd">&nbsp~');
              $('#toDate, #fromDate').unbind().bind('keyup',function(){
                  table.draw();
              })*/
          
          
          });