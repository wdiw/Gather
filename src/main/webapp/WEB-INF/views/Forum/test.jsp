<body>

	<div class="form-group">
		<label>更換封面</label> <input type="file" name="changeImageCover"
			class="file-upload-default" id="changeImageCover">

		<div class="input-group col-xs-12">
			<input type="text" class="form-control file-upload-info" disabled
				placeholder="上傳圖片"> <span class="input-group-append">
				<button class="file-upload-browse btn btn-primary" type="button"
					id="coverImageUpload">上傳</button>
			</span>
		</div>
	</div>


	<div class="form-group">

		<img style="position: relative; left: 250px"
			src="../${project.pImageCover}" width="350" height="300" alt="請選擇照片"
			id="pImageCover" name="pImageCover" class="img-rounded">
	</div>


    <form id="form" class="forms-sample">
        <div class="form-group">
            <label>留言編號</label>
            <input name="id" id="id" 
            class="form-control" value="${forum.id}" disabled>
        </div>

        <div class="form-group">
            <label>留言</label>
            <textarea rows="15" cols="50" 
            id="post" name="post" class="form-control">${forum.post}</textarea>
        </div>
        
        <div class="form-group">
            <label>留言時間</label>
            <textarea rows="15" cols="50" 
            id="post" name="post" class="form-control">${forum.post}</textarea>
        </div>

        <button id="updateButton" type='button' name='updateButton'
            class="btn btn-primary mr-2" onclick="updatebtn(${forum.id})">送出</button>
        
        <button id="deleteButton" type='button' name='deleteButton'
            class="btn btn-danger" onclick="deletebtn(${forum.id})">刪除</button>
        
        <button id="returnButton" type='button' name='returnButton'
            class="btn btn-primary mr-2" onclick='location.href="<c:url value='/Forum/queryAll' />"'>回討論區</button>
        
        <br><br>

    </form>


    <div class="table-responsive">
        <table class="table table-hover">
        
          <thead>
              <tr>
                  <th>留言編號</th>
                  <th>留言人</th>
                  <th>留言內容</th>
                  <th>留言時間</th>
              </tr>
          </thead>
          <c:forEach items='${AllForumComment}' var='forumcomments' >
              <tr>
                  <td>${forumcomments.forumcommentID}</td>
                  <td>
                      <div style="width:100%;white-space:normal;word-wrap:break-word;word-break:break-all;cursor: pointer;">
                        ${forumcomments.forumcommenter}
                      </div>
                  </td>
                  <td onMouseOver="this.style.backgroundColor='pink';" onMouseOut="this.style.backgroundColor='';">
                      <div id="post" name="post" class="showcontent" style="width:100%;white-space:normal;word-wrap:break-word;word-break:break-all;cursor: pointer;" 
                      onMouseOver="this.style.backgroundColor='orange';" 
                      onMouseOut="this.style.backgroundColor='';">
                      ${forumcomments.forumcomment}
                      </div>
                  </td>
                  <td>${forumcomments.forumcommentTime}</td>
              </tr>
          </c:forEach>
      </table>
      
      </div>


	<script type="text/javascript">

	//當更換圖片
	$("#changeImageCover").on("change", function () {
		var changeImageCover = $("#changeImageCover")[0].files[0];
		var reader = new FileReader;
		reader.onload = function (e) {
			$('#pImageCover').attr('src', e.target.result);
		}
		reader.readAsDataURL(changeImageCover);

	});

        function updatebtn(id) {
            // alert(updateId);
            var form = document.getElementById("form")
            var formData = new FormData(form);
            var url = "<spring:url value='/Forum/detail/" + id + "'/>";

            $.ajax({
                url: url,
                type: 'put',
                data: formData,
                contentType: false, //required
                processData: false, // required
                mimeType: 'multipart/form-data',
                success: function (data) {
                    Swal.fire({
                        title: '更新成功',
                        icon: 'success',
                        text: "已經更新！",
                        position: 'center',

                    }).then((result) => {
                        if (result.isConfirmed) {
                            location.href = "<spring:url value='/Forum/queryAll'/>";
                        }
                    })
                },
                error: function (xhr, text) {
                    console.log("status code: " + xhr.status);
                    console.log("error message: " + text);
                    Swal.fire({
                        title: '更新失敗',
                        icon: 'error',
                        text: "更新失敗",
                    })
                }
            })
        } //function updatebtn(id) {


        function deletebtn(id) {

            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-success',
                    cancelButton: 'btn btn-danger'
                },
                buttonsStyling: false
            })

            swalWithBootstrapButtons.fire({
                title: '確定刪除?',
                text: "你將刪除此計畫!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: '刪除!',
                cancelButtonText: '取消!',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {

                    var url = "<spring:url value='/Forum/detail/" + id + "'/>";

                    $.ajax({
                        url: url,
                        type: 'DELETE',
                        data: {},

                        success: function (data) {
                            Swal.fire({
                                position: 'center',
                                icon: 'success',
                                title: '刪除成功',

                                timer: 3000,
                                timerProgressBar: true,
                                showConfirmButton: false,
                            })
                            location.href = "<spring:url value='/Forum/queryAll'/>";
                        },
                        error: function (xhr, text) {
                            swalWithBootstrapButtons.fire(
                                '失敗',
                                '刪除失敗，請確認有此紀錄 ',
                                'error'
                            )
                        }
                    })


                } else if (
                    /* Read more about handling dismissals below */
                    result.dismiss === Swal.DismissReason.cancel
                ) {
                    swalWithBootstrapButtons.fire(
                        '取消',
                        '已取消刪除 ',
                        'success'
                    )
                }
            })
        } //function deletebtn(id) {
        
        function init(){
            var len = 60;      //默认显示字数
            var ctn = document.getElementById("content");  //获取div对象
            var content = ctn.innerHTML;                   //获取div里的内容
            //alert(content);
            var span = document.createElement("span");     //创建<span>元素
            var a = document.createElement("a");           //创建<a>元素
            span.innerHTML = content.substring(0,len);     //span里的内容为content的前len个字符
            a.innerHTML = content.length>len?" 全文":"";  //判断显示的字数是否大于默认显示的字数 来设置a的显示
            a.href = "javascript:void(0)";//让a链接点击不跳转
            a.onclick = function(){
                if(a.innerHTML.indexOf("全文")>0){      //如果a中含有"展开"则显示"收起"
                  a.innerHTML = "收起";
                  span.innerHTML = content;
                }else{
                    a.innerHTML = " 全文";
                    span.innerHTML = content.substring(0,len);
                }
            }
            // 设置div内容为空，span元素 a元素加入到div中
            ctn.innerHTML = "";
            ctn.appendChild(span);
            ctn.appendChild(a);
         }

    </script>

</body>