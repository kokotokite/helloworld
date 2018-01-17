<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<body ng-app="myApp">
<div class="col-md-12">
    <div class="form" ng-controller="myCtrl">

        <form name="myForm" class="form-horizontal" action="http://192.168.20.13:8080/helloworld/student/hello">

            <div class="form-group ">

                <label class="col-md-2">帐号：</label>
                <div class="col-md-4">
                    <div ng-class="{'has-error':myForm.name.$invalid && !myForm.name.$pristine} ">
                        <input class="form-control" type="text" placeholder="请输入帐号" name="name" ng-model="student.name" ng-minlength="3" ng-maxlength="9" required>
                    </div>
                    <div ng-if="!myForm.name.$pristine" ng-messages="myForm.name.$error" role="alert">
                        <div ng-message="minlength">至少3位</div>
                        <div ng-message="maxlength">最多9位</div>
                        <div ng-message="required">不能为空</div>
                    </div>
                </div>







                <label class="col-md-2">密码：</label>
                <div class="col-md-4">
                    <div ng-class="{'has-error':myForm.password.$invalid && !myForm.password.$pristine} ">
                        <input class="form-control" type="password" placeholder="请输入密码" name="password" ng-model="student.password" ng-minlength="6" ng-maxlength="16" required>
                    </div>
                    <div ng-if="!myForm.password.$pristine" ng-messages="myForm.password.$error" role="alert">
                        <div ng-message="minlength">至少6位</div>
                        <div ng-message="maxlength">最多16位</div>
                        <div ng-message="required">不能为空</div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-2">年龄：</label>
                <div class="col-md-4">
                    <div ng-class="{'has-error':myForm.age.$invalid && !myForm.age.$pristine} col-md-2">
                        <input class="form-control" type="number" placeholder="请输入年龄" name="age" ng-model="student.age" required>
                    </div>
                    <div ng-if="!myForm.age.$pristine" ng-messages="myForm.age.$error" role="alert">
                        <div ng-message="number">必须位数字</div>
                        <div ng-message="required">不能为空</div>
                    </div>
                </div>

                <label class="col-md-2">Times：</label>
                <div class="col-md-4">
                    <div ng-class="{'has-error':myForm.times.$invalid && !myForm.times.$pristine} col-md-2">
                        <select class="form-control" name="times" ng-minlength="1" ng-model="student.times" required>
                            <option value="">请选</option>
                            <option value="1">first</option>
                            <option value="2">second</option>
                        </select>
                    </div>
                    <div ng-if="!myForm.times.$pristine" ng-messages="myForm.times.$error" role="alert">
                        <div ng-message="minlength">必须选择一个</div>
                        <div ng-message="required">不能为空</div>
                    </div>
                </div>

                <input class="btn btn-success" type="submit" value="提交" ng-disabled="myForm.$invalid" >
            </div>
        </form>
    </div>
</div>




<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/angular.js/1.4.0-beta.4/angular-1.4.0-beta.5/angular.js"></script>
<script src="https://cdn.bootcss.com/angular-ui-router/1.0.3/angular-ui-router.min.js"></script>
<script src="//code.angularjs.org/1.5.4/angular-messages.js"></script>
<script src="https://cdn.bootcss.com/angular-ui-bootstrap/2.5.0/ui-bootstrap-tpls.js"></script>
<script>
    angular.module('myApp', ['ngMessages','ui.bootstrap']).controller("myCtrl",function ($scope,$http) {
        $scope.submit=function() {
            $http({
                method: 'GET',
                url: 'http://192.168.20.13:8080/helloworld/student/hello'

            }).then(function successCallback(response) {
                console.log(response.data);
            }, function errorCallback(response) {
                console.log('失败');
            });
        }
    })
</script>
</body>
