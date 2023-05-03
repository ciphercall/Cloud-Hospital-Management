var HeadInfoApp = angular.module("HeadInfoApp", ['ui.bootstrap']);

HeadInfoApp.controller("ApiHeadInfoController", function ($scope, $http) {



    var compid = $('#txtcompid').val();



    $http.get('/api/ApiHeadInfo/GetData/', {
        params: {
            Compid: compid,




        }
    }).success(function (data) {
        var Headid = data[0].HeadId;


        //  $('#TestCatId').val(TCatID);

        if (Headid != 0) {
            $scope.HeadInfoData = data;
        }
        else {
            $scope.HeadInfoData = null;
        }

        $scope.loading = false;

    });



    $scope.addrow = function () {
        $scope.loading = false;
        event.preventDefault();
        this.newChild.HeadType = $('#HeadType').val();
        this.newChild.COMPID = $('#txtcompid').val();
        this.newChild.HeadName = $('#HeadName').val();

        this.newChild.Rate = $('#Rate').val();
        this.newChild.HeadFor = $('#HeadFor').val(); 
        this.newChild.Remarks = $('#Remarks').val();

        this.newChild.INSUSERID = $('#InsUserID').val();
        this.newChild.INSLTUDE = $('#latlonPos').val();

        if (this.newChild.HeadType != "" && this.newChild.HeadName!="" && this.newChild.HeadFor!="") {
            $http.post('/api/grid/HeadInformation', this.newChild).success(function (data, status, headers, config) {


                var compid = $('#txtcompid').val();

              

                $http.get('/api/ApiHeadInfo/GetData/', {
                    params: {
                        Compid: compid,

                       


                    }
                }).success(function (data) {
                    var Headid = data[0].HeadId;


                    //  $('#TestCatId').val(TCatID);

                    if (Headid != 0) {
                        $scope.HeadInfoData = data;
                    }
                    else {
                        $scope.HeadInfoData = null;
                    }

                    $scope.loading = false;

                });



                if (data.HeadId != 0) {
                    $('#HeadName').val("");
                    $('#Rate').val("");
                    $('#Remarks').val("");

                    $scope.HeadInfoData.push({ ID: data.ID, HeadType: data.HeadType, HeadName: data.HeadName, Rate: data.Rate, HeadFor: data.HeadFor, Remarks: data.Remarks });
                } else {
                    $('#HeadName').val("");
                    $('#Rate').val("");
                    $('#Remarks').val("");

                    alert("duplicate name will not create");
                }

            }).error(function () {
                $scope.error = "An Error has occured while loading posts!";
                $scope.loading = false;
            });

        } else {
            //$('#TestVACID').val("");

            alert("You missed some input");
        }

    };

    $scope.toggleEdit = function () {
        this.testitem.editMode = !this.testitem.editMode;

    };

    $scope.cancel = function () {
        this.testitem.editMode = !this.testitem.editMode;

        var compid = $('#txtcompid').val();



        $http.get('/api/ApiHeadInfo/GetData/', {
            params: {
                Compid: compid,




            }
        }).success(function (data) {
            var Headid = data[0].HeadId;


          

            if (Headid != 0) {
                $scope.HeadInfoData = data;
            }
            else {
                $scope.HeadInfoData = null;
            }

            $scope.loading = false;

        });

    };

    $scope.save = function () {
        // alert("Edit");
        $scope.loading = true;
        var frien = this.testitem;
        this.testitem.COMPID = $('#txtcompid').val();


        $http.post('/api/ApiAslHMS/SaveData', this.testitem).success(function (data) {
            if (data.HeadId != 0) {
                alert("Saved Successfully!!");
            } else {
                alert("Duplicate data entered");
            }

            frien.editMode = false;

            var compid = $('#txtcompid').val();



            $http.get('/api/ApiHeadInfo/GetData/', {
                params: {
                    Compid: compid,




                }
            }).success(function (data) {
                var Headid = data[0].HeadId;




                if (Headid != 0) {
                    $scope.HeadInfoData = data;
                }
                else {
                    $scope.HeadInfoData = null;
                }

                //$scope.loading = false;

            });

            $scope.loading = false;
        }).error(function (data) {
            $scope.error = "An Error has occured while Saving Friend! " + data;
            $scope.loading = false;

        });
    };

    $scope.deleteTestitem = function () {
        $scope.loading = true;
        var id = this.testitem.ID;
        $http.post('/api/ApiHMS/DeleteData/', this.testitem).success(function (data) {

            $.each($scope.HeadInfoData, function (i) {
                if ($scope.HeadInfoData[i].ID === id) {
                    $scope.HeadInfoData.splice(i, 1);
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