var MgtApp2 = angular.module("MgtApp2", ['ui.bootstrap']);

MgtApp2.controller("ApiMgtController2", function ($scope, $http) {

    //$scope.loading = false;
    //$scope.addMode = false;


    //$scope.loading = true;




    var compid = $('#txtcompid').val();

    

    $http.get('/api/ApiMgt/GetData2/', {
        params: {
            Compid: compid,

          


        }
    }).success(function (data) {
        var ManagementId = data[0].ManagementId;




        if (ManagementId != 0) {
            $scope.MgtData2 = data;
        }
        else {
            $scope.MgtData2 = null;
        }
       

        $scope.loading = false;

    });






    $scope.toggleEdit = function () {
        this.item.editMode = !this.item.editMode;

    };
    $scope.cancel = function () {
        this.item.editMode = !this.item.editMode;


        var compid = $('#txtcompid').val();



        $http.get('/api/ApiMgt/GetData2/', {
            params: {
                Compid: compid,




            }
        }).success(function (data) {
            var ManagementId = data[0].ManagementId;




            if (ManagementId != 0) {
                $scope.MgtData2 = data;
            }
            else {
                $scope.MgtData2 = null;
            }


            $scope.loading = false;

        });
    };



    $scope.save = function () {
        // alert("Edit");
        $scope.loading = true;
        var frien = this.item;
        this.item.COMPID = $('#txtcompid').val();

        this.item.UPDUSERID = $('#Upuserid').val();
        this.item.UPDLTUDE = $('#latlonPos').val();

        $http.post('/api/ApiMgt/SaveData2', this.item).success(function (data) {
            if (data.ManagementId != 0) {
                alert("Saved Successfully!!");
            } else {
                alert("Duplicate data entered");
            }

            frien.editMode = false;


            $scope.loading = false;
        }).error(function (data) {
            $scope.error = "An Error has occured while Saving Friend! " + data;
            $scope.loading = false;

        });
    };

    $scope.deleteitem = function () {
        $scope.loading = true;
        var id = this.item.ID;
        $http.post('/api/ApiRefer/DeleteData/', this.item).success(function (data) {

            $.each($scope.ReferData, function (i) {
                if ($scope.ReferData[i].ID === id) {
                    $scope.ReferData.splice(i, 1);
                    return false;
                }
            });
            $scope.loading = false;
        }).error(function (data) {
            $scope.error = "An Error has occured while Saving Friend! " + data;
            $scope.loading = false;

        });
    };

});